using System;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;

/// <summary>
/// Security 클래스 : 보안 관련 클래스
/// </summary>
public class Security
{
	/// <summary>
	/// Encrypt() 메서드 : 문자열 암호화
	/// </summary>
	/// <param name="cleanString">암호화시킬 문자열</param>
	/// <returns>암호화된 문자열</returns>
	public static string Encrypt(string cleanString)
	{
		Byte[] clearBytes = 
			new UnicodeEncoding().GetBytes(cleanString);
		Byte[] hashedBytes = 
			((HashAlgorithm) CryptoConfig.CreateFromName("MD5")).ComputeHash(clearBytes);
		
		return BitConverter.ToString(hashedBytes);
	}
}