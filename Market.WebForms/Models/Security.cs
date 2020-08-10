using System;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;

/// <summary>
/// Security Ŭ���� : ���� ���� Ŭ����
/// </summary>
public class Security
{
	/// <summary>
	/// Encrypt() �޼��� : ���ڿ� ��ȣȭ
	/// </summary>
	/// <param name="cleanString">��ȣȭ��ų ���ڿ�</param>
	/// <returns>��ȣȭ�� ���ڿ�</returns>
	public static string Encrypt(string cleanString)
	{
		Byte[] clearBytes = 
			new UnicodeEncoding().GetBytes(cleanString);
		Byte[] hashedBytes = 
			((HashAlgorithm) CryptoConfig.CreateFromName("MD5")).ComputeHash(clearBytes);
		
		return BitConverter.ToString(hashedBytes);
	}
}