Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A30BB626E
	for <lists+linux-stm32@lfdr.de>; Fri, 03 Oct 2025 09:15:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89F06C36B0F;
	Fri,  3 Oct 2025 07:15:05 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3611FC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Oct 2025 07:15:04 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3ee15b5435bso1139011f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 03 Oct 2025 00:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759475703; x=1760080503;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=SCxy5SDWHowEDbxrjGnQzeWW2JpysbkJk+FBY3MBfRc=;
 b=QJPBvswwoMIxT71mqBux6yjWdAGBVDwl9midWdED81U99GDsuHsDZk5uEL0mt3sPAM
 2z36eGaMY45QyB+/7uqwA7lAbDMmrBhfPEW+xBRIO0rp6QkkcNre3QdNvS9ui8PjV0fa
 0G09+P8GciEE4Gt2Z69LXUDPC4y6b4C6uR6x5NfIG06UrvxZEjFPpu6maboEb/A0qFKU
 +GtKqQ/emVzJiknCUlCe2K84rhXqYxXxY74iH8aCOZLcgMklKrfag7I4bP4X6n/m2hzi
 SJ1rQ9SO3O707xLuhkqs4r5gAJW83HgNVfXxqcYpwqO1t7c3lt1BwUUAmHIKXKYvdLs5
 TN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759475703; x=1760080503;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SCxy5SDWHowEDbxrjGnQzeWW2JpysbkJk+FBY3MBfRc=;
 b=YnoWgPra0DoqKJLzzzvxWzNMlYaKyYcgr31V1oHjiNbigQZF/R7xt4pHOXZWrs5bXM
 Mm2BQ4uoiqYMuNT703o8HuJxzYTNddLrXxKcBkhGJX+MsRoQOAKIeMzLYi2ZXeBvCLb/
 rUSsfh4EuEhgtejuyUkOHKCVLi/7J9SHVDQdHiiDh235ExLSraolOH+bUxwQKQZwtXyM
 Ml8k7LxSVF74cWWDs+wQ+Pez3+MsSbvHS04dqIMuTykFVfBXn9DqGGpiJ7haCErgR9P6
 xqF5YR5ZlBXqGLHrnGXWTd4wuII8T4J2qYD51XMB9l7hvlW9jk2xOPnj57oKD8eET2Iy
 ZkeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzT4R7afskIzz8jgReQR0JCKGd+AFTFSHsi7I949LJWgHJIHZGVv91FZ5yJwMFxbNdy1bWsuyiMl7EKQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwqNOLIZ2OcF4wqTWUaZqdMlCzN8VJUBy/cq42PBBojgqcqD0gf
 ve9+8X+BuvBf22h/F+DGDvyy6+UQtdkG6xrfyx84gcsLcnexmOefgj0W
X-Gm-Gg: ASbGncuHHWuZ1jMCsleOO+hEidvdKwETEIy75qWbSVi8i9upcM1S1O1j+n8GN4xExpg
 xOqKd6pjBDiUczCtzjqzBpTer79EAzfgYEr4JCmeV4R13RjMjGBCBadQiMJEk0nKNEi/X4Cr8CJ
 XdxmaatC+EnXfDiXoStkji+1/EAmy7rtWbDKE3uCUSL0hi7TGQsIVvIIQE1oQRKiDLpUlRFWT5r
 nqwy7LAaaNbFdERCSoSAajWON8UQOB5DMbX/ebiIhlD8ftPt3qTf6V48pgfRvQYG2W1+wzVjthm
 SdgPN7OOfD/WQgtvyazL5hPCkFgvEbGZMiveB+cT5JF4oobW79ba5SzBIt88Bfmd1M159JWr+rt
 BzOUbvVlrTp4mj1w5dD80BpPFVs5IWvgoWEFZUP48ql0deKgbMh8SKXCUPFfyrXwDOH6OWDRF5z
 L6fGjq5PCC5D4zt0yQkc8=
X-Google-Smtp-Source: AGHT+IGLTbbL0+EcLoLbEHHZSN9rL8yQmh7AzCqkvRkhjUJXYn5Zs5RuD/3SDImWP4OlYSCEwRkZcA==
X-Received: by 2002:a05:6000:610:b0:3fe:d6df:c679 with SMTP id
 ffacd0b85a97d-425671c1c62mr1159606f8f.55.1759475703242; 
 Fri, 03 Oct 2025 00:15:03 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:94c4:fb0e:28f:2a8d?
 ([2001:818:ea56:d000:94c4:fb0e:28f:2a8d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8abe9bsm6738262f8f.22.2025.10.03.00.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 00:15:02 -0700 (PDT)
Message-ID: <5243c2c5a8f3dd24f40e30a695e2a3d4f948f388.camel@gmail.com>
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>, Jonathan Cameron	
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?=	 <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Maxime Coquelin	 <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 03 Oct 2025 07:15:56 +0100
In-Reply-To: <20251002112250.2270144-1-olivier.moysan@foss.st.com>
References: <20251002112250.2270144-1-olivier.moysan@foss.st.com>
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32-dfsdm: fix st,
 adc-alt-channel property handling
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gVGh1LCAyMDI1LTEwLTAyIGF0IDEzOjIyICswMjAwLCBPbGl2aWVyIE1veXNhbiB3cm90ZToK
PiBJbml0aWFsbHkgc3QsYWRjLWFsdC1jaGFubmVsIHByb3BlcnR5IHdhcyBkZWZpbmVkIGFzIGFu
IGVudW0gaW4gdGhlIERGU0RNCj4gYmluZGluZy4gVGhlIERGU0RNIGJpbmRpbmcgaGFzIGJlZW4g
Y2hhbmdlZCB0byB1c2UgdGhlIG5ldyBJSU8gYmFja2VuZAo+IGZyYW1ld29yaywgYWxvbmcgd2l0
aCB0aGUgYWRvcHRpb24gb2YgSUlPIGdlbmVyaWMgY2hhbm5lbHMuCj4gSW4gdGhpcyBuZXcgYmlu
ZGluZyBzdCxhZGMtYWx0LWNoYW5uZWwgaXMgZGVmaW5lZCBhcyBhIGJvb2xlYW4gcHJvcGVydHks
Cj4gYnV0IGl0IGlzIHN0aWxsIGhhbmRsZWQgaGFzIGFuIGVudW0gaW4gREZTRE0gZHJpdmVyLgo+
IEZpeCBzdCxhZGMtYWx0LWNoYW5uZWwgcHJvcGVydHkgaGFuZGxpbmcgaW4gREZTRE0gZHJpdmVy
Lgo+IAo+IEZpeGVzOiAzMjA4ZmEwY2Q5MTkgKCJpaW86IGFkYzogc3RtMzItZGZzZG06IGFkb3B0
IGdlbmVyaWMgY2hhbm5lbHMgYmluZGluZ3MiKQo+IFNpZ25lZC1vZmYtYnk6IE9saXZpZXIgTW95
c2FuIDxvbGl2aWVyLm1veXNhbkBmb3NzLnN0LmNvbT4KPiAtLS0KClJldmlld2VkLWJ5OiBOdW5v
IFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPgoKPiDCoGRyaXZlcnMvaWlvL2FkYy9zdG0zMi1kZnNk
bS1hZGMuYyB8IDUgKystLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FkYy9zdG0zMi1kZnNk
bS1hZGMuYyBiL2RyaXZlcnMvaWlvL2FkYy9zdG0zMi1kZnNkbS1hZGMuYwo+IGluZGV4IDc0YjFi
NGRjNmU4MS4uOTY2NGI5YmQ3NWQ0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaWlvL2FkYy9zdG0z
Mi1kZnNkbS1hZGMuYwo+ICsrKyBiL2RyaXZlcnMvaWlvL2FkYy9zdG0zMi1kZnNkbS1hZGMuYwo+
IEBAIC03MjUsOSArNzI1LDggQEAgc3RhdGljIGludCBzdG0zMl9kZnNkbV9nZW5lcmljX2NoYW5u
ZWxfcGFyc2Vfb2Yoc3RydWN0Cj4gc3RtMzJfZGZzZG0gKmRmc2RtLAo+IMKgCX0KPiDCoAlkZl9j
aC0+c3JjID0gdmFsOwo+IMKgCj4gLQlyZXQgPSBmd25vZGVfcHJvcGVydHlfcmVhZF91MzIobm9k
ZSwgInN0LGFkYy1hbHQtY2hhbm5lbCIsICZkZl9jaC0KPiA+YWx0X3NpKTsKPiAtCWlmIChyZXQg
IT0gLUVJTlZBTCkKPiAtCQlkZl9jaC0+YWx0X3NpID0gMDsKPiArCWlmIChmd25vZGVfcHJvcGVy
dHlfcHJlc2VudChub2RlLCAic3QsYWRjLWFsdC1jaGFubmVsIikpCj4gKwkJZGZfY2gtPmFsdF9z
aSA9IDE7Cj4gwqAKPiDCoAlpZiAoYWRjLT5kZXZfZGF0YS0+dHlwZSA9PSBERlNETV9JSU8pIHsK
PiDCoAkJYmFja2VuZCA9IGRldm1faWlvX2JhY2tlbmRfZndub2RlX2dldCgmaW5kaW9fZGV2LT5k
ZXYsIE5VTEwsCj4gbm9kZSk7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
