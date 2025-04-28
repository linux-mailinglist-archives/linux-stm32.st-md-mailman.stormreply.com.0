Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6BFA9EB59
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Apr 2025 11:01:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 514DBC78011;
	Mon, 28 Apr 2025 09:01:46 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E60F2C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 07:01:09 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-736c1138ae5so4366561b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 00:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745823668; x=1746428468;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9yZmW0hn3MrvYOWlnfGa/3CtDPfOpCdnzl3M85GUApc=;
 b=g20ll84RAQIp8M1VH+aX39s4LQ0L/CxznTCjffGqhash4Mvnsle200LEVAZzoUAJl0
 WBGNz0FPKuSBoFK8N9nVyijmaDYb7VeSgcausMlA1+ZnOVMypw09RA2/wq7IK6b4xflL
 TTnfI1TL52No80dvHwhjCXvf87bQiWQbJtQv/wnhDFhQX5sbmmn9y9/spSAz2gWe2YEr
 eVjmLHC3+hTBi8mmrk6z5wEB5kNep8qXcMtnv5TcgwuHMbP8DZCvA+6uZDQFL1bwt7d2
 NpkZhXF4slSthVJHwJWNMx32f2iYljIZin/TNwe2QqMkhL1mDQBif39CSartk67pRwX5
 ItxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745823668; x=1746428468;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9yZmW0hn3MrvYOWlnfGa/3CtDPfOpCdnzl3M85GUApc=;
 b=SiUn2D6+522qr8PGf/pVdHDtZqLymT8pDwUH2WWsPn5Uew7c2A0KDXhaHfddveiQYL
 lQ1vjew6j40eE6hCh7zSEQijZAS1p1Xq7eBRtw+NE7SSKt3HGKTEAPzl8NTTIaTpd8KX
 QdKX5vtk5s0p5LAbV/Qqiu0pZFWTX0cdC7bHGJtRnQdVJ1VUYsyvpkOGtPE4KIFxGCyI
 fEvyZmFzijCJeKJqVz3xjm8IYyG+oZuVA9qL9VetrKHhJG+8M5QPfRASjzGFhIYntPBE
 J5EDCiRxEX+j5fiws8KjQCCiygXRN25w9pwscmdjZ1HOV7sj1S5bLvhbgoHV37cjAsj6
 PCWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMLelKWCBkdmxWwHiEaJbzRWLHNAfYHCGNq6aXiSsODjhZvqXFpwKDRxY7V6J6e5h8glGOh1sBSB95ZQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwkS+iKRk5aFMvw/yZi3iuZmX6w+h3mbo/R7U64YUqSAt2pFk2U
 iE71FhnaApS5s6YUMpE15xdJ/TUvNgsA9tLhe+lXT1PmO/aD1D13
X-Gm-Gg: ASbGncsoy3Mr0AeRIX44fFckwZQjZ+d8WvlH4JqJexsyBONSjLGiAenRMHm4+AncL+/
 z5Y3NDdSqf5BgUQEDDceQhaLXQ2zndAJKgX47gi0pgmY3kty0931qquGUklN4vN4Ivveadq9E2n
 SSddQg0/zpqCKVNfdMYR3nRCVN2vchWBiCVUVm4+bvT8S6UajFs91gT3wiiYjPvQy4+ZztAIil7
 y7R18TRQi6tlkxr7O4LTwF7hfas1oGavie/WbOGhuFCK7FjXINw11X9HvVKQmbEoIhu77JWjTMo
 ScF4U/j6tRa9pzED0I+Vfu1d6YXS5Z+uVCM9
X-Google-Smtp-Source: AGHT+IGP4IZjA+2oOl5Xp+BcG0TkWdBytzGu1mFgdq9c4ypqmC8f8TKCih+yUOSsexG/Sbbus31DKg==
X-Received: by 2002:a05:6a00:2e14:b0:736:5664:53f3 with SMTP id
 d2e1a72fcca58-73ff73bcf1emr9419880b3a.15.1745823668236; 
 Mon, 28 Apr 2025 00:01:08 -0700 (PDT)
Received: from [192.168.0.56] ([38.34.87.7]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25a9abf2sm7173316b3a.122.2025.04.28.00.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 00:01:07 -0700 (PDT)
Message-ID: <3a16fae0346d4f733fb1a67ae6420d8bf935dbd8.camel@gmail.com>
From: Eduard Zingerman <eddyz87@gmail.com>
To: Alexis =?ISO-8859-1?Q?Lothor=E9?= "(eBPF Foundation)"	
 <alexis.lothore@bootlin.com>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko	 <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu	 <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, KP Singh	 <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@fomichev.me>, Hao Luo	 <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Puranjay Mohan	 <puranjay@kernel.org>, Xu Kuohai
 <xukuohai@huaweicloud.com>, Catalin Marinas	 <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mykola Lysenko	 <mykolal@fb.com>, Shuah Khan
 <shuah@kernel.org>, Maxime Coquelin	 <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>,  Florent Revest <revest@chromium.org>
Date: Mon, 28 Apr 2025 00:01:05 -0700
In-Reply-To: <20250411-many_args_arm64-v1-3-0a32fe72339e@bootlin.com>
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-3-0a32fe72339e@bootlin.com>
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Apr 2025 09:01:44 +0000
Cc: linux-kselftest@vger.kernel.org,
 Bastien Curutchet <bastien.curutchet@bootlin.com>, ebpf@linuxfoundation.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC bpf-next 3/4] bpf/selftests: add tests
 to validate proper arguments alignment on ARM64
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

T24gRnJpLCAyMDI1LTA0LTExIGF0IDIyOjMyICswMjAwLCBBbGV4aXMgTG90aG9yw6kgKGVCUEYg
Rm91bmRhdGlvbikgd3JvdGU6Cj4gV2hlbiBkZWFsaW5nIHdpdGggbGFyZ2UgdHlwZXMgKD44IGJ5
dGVzKSwgQVJNNjQgdHJhbXBvbGluZXMgbmVlZCB0byB0YWtlCj4gZXh0cmEgY2FyZSBhYm91dCB0
aGUgYXJndW1lbnRzIGFsaWdubWVudCB0byByZXNwZWN0IHRoZSBjYWxsaW5nCj4gY29udmVudGlv
biBzZXQgYnkgQUFQQ1M2NC4KPiAKPiBBZGQgdHdvIHRlc3RzIGVuc3VyaW5nIHRoYXQgdGhlIEJQ
RiB0cmFtcG9saW5lIGFycmFuZ2VzIGFyZ3VtZW50cyB3aXRoCj4gdGhlIHJlbGV2YW50IGxheW91
dC4gVGhlIHR3byBuZXcgdGVzdHMgaW52b2x2ZSBhbG1vc3QgdGhlIHNhbWUKPiBhcmd1bWVudHMs
IGV4Y2VwdCB0aGF0IHRoZSBzZWNvbmQgb25lIHJlcXVpcmVzIGEgbW9yZSBzcGVjaWZpYyBhbGln
bm1lbnQKPiB0byBiZSBzZXQgYnkgdGhlIHRyYW1wb2xpbmUgd2hlbiBwcmVwYXJpbmcgYXJndW1l
bnRzIGJlZm9yZSBjYWxsaW5nIHRoZQo+IHRoZSB0YXJnZXQgZnVuY3Rpb24uCj4gCj4gU2lnbmVk
LW9mZi1ieTogQWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24pIDxhbGV4aXMubG90aG9y
ZUBib290bGluLmNvbT4KPiAtLS0KClsuLi5dCgo+ICtTRUMoImZlbnRyeS9icGZfdGVzdG1vZF90
ZXN0X3N0cnVjdF9hcmdfMTEiKQo+ICtpbnQgQlBGX1BST0cyKHRlc3Rfc3RydWN0X21hbnlfYXJn
c185LCBzdHJ1Y3QgYnBmX3Rlc3Rtb2Rfc3RydWN0X2FyZ181LCBhLAo+ICsJICAgICAgc3RydWN0
IGJwZl90ZXN0bW9kX3N0cnVjdF9hcmdfNSwgYiwKPiArCSAgICAgIHN0cnVjdCBicGZfdGVzdG1v
ZF9zdHJ1Y3RfYXJnXzUsIGMsCj4gKwkgICAgICBzdHJ1Y3QgYnBmX3Rlc3Rtb2Rfc3RydWN0X2Fy
Z181LCBkLCBpbnQsIGUsCj4gKwkgICAgICBzdHJ1Y3QgYnBmX3Rlc3Rtb2Rfc3RydWN0X2FyZ181
LCBmKQoKSGVsbG8gQWxleGlzLAoKSSdtIHRyeWluZyB0byBkb3VibGUgY2hlY2sgdGhlIGVycm9y
IHlvdSd2ZSBzZWVuIGZvciB4ODYuCkkgc2VlIHRoYXQgdHJhY2luZ19zdHJ1Y3Qvc3RydWN0X21h
bnlfYXJncyBmYWlscyB3aXRoIGFzc2VydGlvbjoKInRlc3Rfc3RydWN0X21hbnlfYXJnczpGQUlM
OnQxMTpmIHVuZXhwZWN0ZWQgdDExOmY6IGFjdHVhbCAzNSAhPSBleHBlY3RlZCA0MyIuCkNvdWxk
IHlvdSBwbGVhc2UgaGVscCBtZSB1bmRlcnN0YW5kIHRoaXMgdGVzdD8KVGhlIGZ1bmN0aW9uIGxp
c3RlbmVkIHRvIGlzIGRlZmluZWQgYXMgYWNjZXB0aW5nICdzdHJ1Y3QgYnBmX3Rlc3Rtb2Rfc3Ry
dWN0X2FyZ183JywKYXQgdGhlIHNhbWUgdGltZSB0aGlzIGZ1bmN0aW9uIHVzZXMgJ3N0cnVjdCBi
cGZfdGVzdG1vZF9zdHJ1Y3RfYXJnXzUnLgpOZXZlcnRoZWxlc3MsIHRoZSBhc3NlcnRpb24gcGVy
c2lzdHMgZXZlbiB3aXRoIGNvcnJlY3QgdHlwZXMuCgo+ICt7Cj4gKwl0MTFfYSA9IGEuYTsKPiAr
CXQxMV9iID0gYi5hOwo+ICsJdDExX2MgPSBjLmE7Cj4gKwl0MTFfZCA9IGQuYTsKPiArCXQxMV9l
ID0gZTsKPiArCXQxMV9mID0gZi5hOwo+ICsJcmV0dXJuIDA7Cj4gK30KClsuLi5dCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
