Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E169ED31E
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Dec 2024 18:12:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E43A4C7128A;
	Wed, 11 Dec 2024 17:12:17 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83462C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Dec 2024 17:12:10 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2166360285dso31465935ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Dec 2024 09:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733937129; x=1734541929;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=sIXMJ1ZYrC0ZfzeXus7WJ4iSXyvaP59GTvAsdbdQD+Y=;
 b=MuSWK6e+5DfZdYE+mbqDd6jQeMkcByNB6d1u1xrGXdZ8eqoyPCBSU5C4/F4Z7A0+L2
 vsOQ79mAKrGp45+xxgLZWjgtdVkvhyR05vX6HXhIk2rOJ2uCqHMHEZ5fmPV82aOmX/Qy
 sIfJzdPqte9vapCbcTIbKPM13/4SOG5i/bnCH3MxnIY9NhJ+zMXx3r4L/xE9FvjL7sIY
 w1c/yctbRnrTQc8SMu5SbG4Zh4Enr+z7Vtu4B1J8XLoYviZ6cpu6GWBDeLpSyRnjEBR7
 ZQ1oMcoKiQmIfihrvqyRsplRI8Iw0F7JdDI0iL15R7+TvK4MpP94pWwBC9Z/kChH10K1
 uwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733937129; x=1734541929;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sIXMJ1ZYrC0ZfzeXus7WJ4iSXyvaP59GTvAsdbdQD+Y=;
 b=K+D27nb8gE0PD1Ev5z68wYtcsZ+la6kqvTagyCVwbGXFOyZjm5hQpRqvEd19DVBVSd
 NugrX2b+3tI4Jyg1tDmYDCRc9sUR+tFBkH8OCdsfox+T0KA660JeoWRkQBtHyhGjx2AF
 C4yqOIblpHin5x75ZQDeetUSdL6PJgMD7ni469n6VEbmLMFpTZwKDKPkDAiF9rPQUPj0
 inQvYGKDq8woMq9PYbvFuM3ddgngdVJkgnYmcoeQvLCpVjt7obltzBqnrqqCkX8LQZfd
 5CMfvmuVPnthScYmByQKD/PJ844BX+/vo+Hf5T4OcsEnmdfpSaUPr/3XQJ7NyJdsxRZH
 KTdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjXJ3/mT1Em2UexxmXpJ0oPpOny3OsczbT1oXzKefRci8sWVmP6H0QIkQpDuAYKObnGX+vvg/jlZaECg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz33RNf/H9T8+2Aif1ilz/IYLukz9+yz46dGFIY7YrQ+0t5gDMq
 4azPrlAssjEmoHOUfi/ZlPHfioLWFDhYZM7SX19ANmJJTqHjckqu
X-Gm-Gg: ASbGncsAX8+iEM4eLQYME5Ui+Ebc68x3itH9MFwhqN0wv+qINfFqkUsx3COEbWepeuN
 VBEnJcdlngN3HdGYEf/UVaqirXxlSNEHwu8pFVjLqprYg+85opbsloOim4kSIkX91BVW46+EQL6
 hTy+S0aTn2s2oC3/GhL1aEY58DPQJ3ClLje9+PGUvVYe4Vxu6+tWkTao6JOxYlR2yjLne8zah/+
 lBHeNPoH2qhvD2dUWPtF68rDkwmII6fPLgGhA0PhSzz5om8LiEAl0yxKfybTdM6YJ0hhhtCaTh5
 Wu+gi+3OPPqTtlGBeFQJvAKXNOI=
X-Google-Smtp-Source: AGHT+IHYT7AOgxnWx/J7njq421pvdT5RVtm7+2GQ8l+rCNO36MOZPhHyAqro6NWj/eR2bXFBKcZViQ==
X-Received: by 2002:a17:902:f78b:b0:216:7cef:99b3 with SMTP id
 d9443c01a7336-2178af03c54mr7681475ad.52.1733937128927; 
 Wed, 11 Dec 2024 09:12:08 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5?
 ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21779e0f7besm15574125ad.115.2024.12.11.09.12.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 09:12:08 -0800 (PST)
Message-ID: <213073e5-c929-4207-a9a5-13194012cf70@roeck-us.net>
Date: Wed, 11 Dec 2024 09:12:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20241211163457.301140-1-clement.legoffic@foss.st.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241211163457.301140-1-clement.legoffic@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] watchdog: stm32_iwdg: fix DT backward
	compatibility
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMTIvMTEvMjQgMDg6MzQsIENsw6ltZW50IExlIEdvZmZpYyB3cm90ZToKPiBUaGUgY29tbWl0
IDNhYjE2NjNhZjZjMSAoIndhdGNoZG9nOiBzdG0zMl9pd2RnOiBBZGQgcHJldGltZW91dCBzdXBw
b3J0IikKPiBpbnRyb2R1Y2VzIHRoZSBzdXBwb3J0IGZvciB0aGUgcHJlLXRpbWVvdXQgaW50ZXJy
dXB0Lgo+IAo+IFRoZSBzdXBwb3J0IGZvciB0aGlzIGludGVycnVwdCBpcyBvcHRpb25hbCBidXQg
dGhlIGRyaXZlciBtYW5kYXRlcyB0aGUKPiBpbnRlcnJ1cHRzIHByb3BlcnR5IGluIHRoZSBkZXZp
Y2UtdHJlZSwgYnJlYWtpbmcgdGhlIGNvbXBhdGliaWxpdHkgd2l0aAo+IGV4aXN0aW5nIGRldmlj
ZS10cmVlcy4KPiAKPiBVc2UgdGhlIHBsYXRmb3JtX2dldF9pcnFfb3B0aW9uYWwoKSBBUEkgdG8g
Y29tcGx5IHdpdGggZXhpc3RpbmcKPiBkZXZpY2UtdHJlZXMuCj4gCj4gRml4ZXM6IDNhYjE2NjNh
ZjZjMSAoIndhdGNoZG9nOiBzdG0zMl9pd2RnOiBBZGQgcHJldGltZW91dCBzdXBwb3J0IikKPiBT
aWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5z
dC5jb20+CgpSZXZpZXdlZC1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PgoK
PiAtLS0KPiAKPiBQbGVhc2UgY29uc2lkZXIgbWVyZ2luZyB0aGlzIHBhdGNoIGluIHRoZSB2Ni4x
MyBjeWNsZSB0byBhdm9pZCBicmVha2luZwo+IHRoZSBjb21wYXRpYmlsaXR5IG9mIHRoZSBleGlz
dGluZyBkZXZpY2UtdHJlZS4KPiAKPiBkcml2ZXJzL3dhdGNoZG9nL3N0bTMyX2l3ZGcuYyB8IDIg
Ky0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL3N0bTMyX2l3ZGcuYyBiL2RyaXZlcnMvd2F0
Y2hkb2cvc3RtMzJfaXdkZy5jCj4gaW5kZXggZDcwMGUwZDQ5YmI5NS4uOGFkMDZiNTRjNWFkYyAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL3N0bTMyX2l3ZGcuYwo+ICsrKyBiL2RyaXZl
cnMvd2F0Y2hkb2cvc3RtMzJfaXdkZy5jCj4gQEAgLTI4Niw3ICsyODYsNyBAQCBzdGF0aWMgaW50
IHN0bTMyX2l3ZGdfaXJxX2luaXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKPiAgIAlp
ZiAoIXdkdC0+ZGF0YS0+aGFzX2Vhcmx5X3dha2V1cCkKPiAgIAkJcmV0dXJuIDA7Cj4gCj4gLQlp
cnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwo+ICsJaXJxID0gcGxhdGZvcm1fZ2V0X2ly
cV9vcHRpb25hbChwZGV2LCAwKTsKPiAgIAlpZiAoaXJxIDw9IDApCj4gICAJCXJldHVybiAwOwo+
IAo+IAo+IGJhc2UtY29tbWl0OiBmYWMwNGVmYzVjNzkzZGNjYmQwN2UyZDU5YWY5ZjkwYjdmYzBk
Y2E0Cj4gLS0KPiAyLjM0LjEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
