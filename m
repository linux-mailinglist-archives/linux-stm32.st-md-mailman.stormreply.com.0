Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 099A8A80E9B
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Apr 2025 16:43:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2398C78F75;
	Tue,  8 Apr 2025 14:43:15 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B331BC7803B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Apr 2025 14:43:14 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-603ff8e915aso1419478eaf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Apr 2025 07:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744123393; x=1744728193;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZX0aGXRptTCUQcorsU5tL8EzdmJ/4Dcw0VhDpZ9VkFw=;
 b=ROAtfWvwhHbHFi0GSFSd0Ankc8Sh9WBurOrWko7Jw32PR+nB8tT5p5PNUo9SgWeXUB
 O86RpUciDLowNUlRrMMSi5Ti0xxWvZgJ11dram5X7zARpGpO7JF8DlHbb7iPLDbn6vd5
 9A3MrOiwtNwgl7ljmc+OSWrrYkiaBpQjT78SLt7DG85QhgHd0qAo+XNym+6qN2yQg5bg
 w0R1ElKqlaRMnldSHp50qZUsf2w5tgZUzX85FQ2UgXbwWxZaEtG4mHb1x8x1voI+d2rN
 PfiiEQfldhnnnvZrezEsJU+X/yqUviW5fBUBOe1S4POblCA9AcGyoc3GlJFwmBKRYKuc
 w2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744123393; x=1744728193;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZX0aGXRptTCUQcorsU5tL8EzdmJ/4Dcw0VhDpZ9VkFw=;
 b=DneE3F1XYc5Ikn116YYZ3E3dsBR9nq89zMjTFWVOWq1bFRpDtm9xUykw27OLuuuskv
 PPxTfC6z2JfI060YHiYfCEcWjJqy1GR12IoxOD4qW9ES1UsClnLhgQbnru7eHjAbeGQc
 Ce8QMKFrYt2lxkt5was+Eztj2XP/rNjYXGrmwasvNZJGa69pCkAmuEV6mTDC1wt3ZYMm
 +EjqrQzJfu6zeqvgJhqkLdIRuJ0u0uLjHwjcXQAShfl5qPGA4CLHpfLqWSQXbdLVRaIy
 /GstqLYwtGHecD3mYQUaQaeknoO9yG0LpS3cLw4CkrKykUc+C+Ja9X0ares3Gf8fMCjK
 l6hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIsostSXAsZXiNOQZ/DB0GNcwJBESJD7MDbV6qh9o1OjSJ4Kq6Rbn4f6a30E4BIis4PIQnMu5hD9Mx3A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwYaaNl9VXvmFYHMAl+lPhkU7ftlAbgzeyRpNIC7lOirVt4YlEH
 H3H8yniYMxe9nXOF0DznbmkJ51xLkR20CuVKXQlt9nmNSa1Jn5rTS0UYLZPPKWU=
X-Gm-Gg: ASbGncujNzrKdwJX7LporFtxzmcj9h0ty8Xd6GL8NPZMqelSOJ5t9XV+LZ44Pi1XcMU
 o4NCR+RPAYm/SAH/PYguI9CFDJ8WingK7PEHp1Oo3e9G2vMnq9vq+BJU+GCCPLG4AY1PHugbTB3
 Hiw8qiWfnh68Xq6IIKxyRWjEHMhPzxkTVmbLv4FzKS2qRWXGgAP7wr/OStWgp2tGFK++S+WxHaa
 VjfQ0/fAG22x8nmY/SM4i6H4XD1daNZ60t6NyzJkiY/w2G+Ki3rsDnpQcCPOAxNIScTrlsMNC4d
 OktXym81/cT8LQu2dR2KDqR8F41NJaHvjLZjqVOCvRy86z6DnCOdR+K6tnGEMTh4p1bOlp/vEcD
 8YRKE3zv2JWkU10PG
X-Google-Smtp-Source: AGHT+IHydLilQvszzuRpWvpl8zBnzCfe2oBsCFFQZFAPCcrx+PW2NEIcAFyuNBZbinDzJI3j0Elo8w==
X-Received: by 2002:a05:6808:4493:b0:3f8:7c69:561b with SMTP id
 5614622812f47-4004d99ffe3mr7838878b6e.14.1744123393329; 
 Tue, 08 Apr 2025 07:43:13 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40069105b97sm475279b6e.13.2025.04.08.07.43.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 07:43:12 -0700 (PDT)
Message-ID: <0550fb58-cff3-47fd-b5f4-cbc19113436c@baylibre.com>
Date: Tue, 8 Apr 2025 09:43:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Olivier MOYSAN <olivier.moysan@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20250403162358.1257370-1-olivier.moysan@foss.st.com>
 <25b34e60-5392-4bfb-b994-49212dfbdb22@baylibre.com>
 <6d12b6fe-85fb-4345-bf32-02c0fbb1a27a@foss.st.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <6d12b6fe-85fb-4345-bf32-02c0fbb1a27a@foss.st.com>
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] iio: adc: stm32: add oversampling
	support
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

T24gNC83LzI1IDExOjA3IEFNLCBPbGl2aWVyIE1PWVNBTiB3cm90ZToKPiBIaSBEYXZpZCwKPiAK
PiBUaGFua3MgZm9yIHJldmlld2luZywKPiAKPiBPbiA0LzQvMjUgMTg6MTUsIERhdmlkIExlY2hu
ZXIgd3JvdGU6Cj4+IE9uIDQvMy8yNSAxMToyMyBBTSwgT2xpdmllciBNb3lzYW4gd3JvdGU6Cgou
Li4KCj4+PiArI2RlZmluZSBTVE0zMkg3X09WU1JfTUFTS8KgwqDCoMKgwqDCoMKgIEdFTk1BU0so
MjUsIDE2KSAvKiBDb3JyZXNwb25kIHRvIE9TVlIgZmllbGQgaW4gZGF0YXNoZWV0ICovCj4+Cj4+
IG5pdDogQ29tbWVudCBzZWVtcyBvYnZpb3VzIGFuZCBjYW4gYmUgbGVmdCBvdXQuCj4+Cj4gCj4g
T3ZlcnNhbXBsaW5nIGJpdCBuYW1lIGlzICJPU1ZSIiBpbiBkYXRhc2hlZXQgSDcsIHdoaWxlIG92
ZXJzYW1wbGluZyBzaGlmdCBpcyAiT1ZTUyIuIEZvciBuYW1pbmcgY29uc2lzdGVuY3ksIEkgdXNl
ZCBPVlNSIGluc3RlYWQgb2YgT1NWUiwKPiBhbmQgaGlnaGxpZ2h0ZWQgaXQgd2l0aCBhIGNvbW1l
bnQuIEFzIGFuIGFsdGVybmF0aXZlLCBTVE0zMkg3X09WU1IgY291bGQgYmUgcmVuYW1lZCwgYnV0
IEkgd291bGQgcmF0aGVyIGtlZXAgaXQgdW5jaGFuZ2VkLgo+IAoKQWgsIG15IGV5ZXMgZG8gbm90
IGVhc2lseSBzZWUgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBPU1ZSIGFuZCBPVlNSLgoKTWFrZXMg
c2Vuc2UgdG8ga2VlcCBpdCBzbyBncmVwIHBpY2tzIHVwIGJvdGggc3BlbGxpbmdzLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
