Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FB39D4176
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 18:49:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F18DC7A82A;
	Wed, 20 Nov 2024 17:49:44 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F9C2C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Nov 2024 10:31:32 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-71e681bc315so604356b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Nov 2024 02:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730975491; x=1731580291;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YkraiRUrks+s5pcHcVdDbNI0v0htZdI4Vc5A2KCgS+Q=;
 b=dF2UYAbW+f58DE9jZgM/vryGIgNDbOCbaBo2XT8tgptm4tgrURjtZjdyjYxAn3qXmA
 z4AI0myo/XJLI2kxAqc7OkPevjOL7V7fBgHfLNOaQNX5tGZB+BQ68HnmHWfGoej53il5
 DWeLVECrb/s8mszTJaaaFnkT7tEYkQH/Y1kwTmkL3EM9b7LAnFKAr08TPYtQUV/27+Tr
 7noB30bAoodE8T8rSW84wJNuMm2aUTB0y8EoktnnlrRl5scFW8E2NHHfPLmr0zBk1Z5U
 a3Vay77NrZK8leDgEvQ3QzejIT/CYMxREHgJlLbW+m0gOIWBIw4KZg7ZiK0rKoP3DKP8
 bGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730975491; x=1731580291;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YkraiRUrks+s5pcHcVdDbNI0v0htZdI4Vc5A2KCgS+Q=;
 b=qM1Tga+3ntXvGfUXlPPRjOMsdEmqUOW2TtcRlV65SPyMiv0JLtFH/dShpTzJeJMBJO
 /bmnYvhThbMMOYGjsrbpjho/1u7a7dzPSoLXp8NaHqxJsB7wfAtOqrYt//Hadn7mxSAj
 ooEpr3ecskwWHdfm55KF0vDf/9yLJ4ArXvhn4wIEFP/rceH2Oi4utr50eVTvMAhNqTp/
 7A3FZxIeCIwexHEbow8W1m+5Jc21Z7LXfd1+5ukgY23ns4ZRhMKeotIiHaLpSPqV11S0
 Q2c10K/i9CFl3A7OYZ+++dbyhC/oXXb5Vb3OqmmJ24wKNVUFz5AOTwMku38J4JsMQ4Jf
 DBDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0RVj2wT+ozmBca9BlTNMeNjImf03yz9nfK7vObxk7uBDQyXJGKB0hKNRIZMeWyvOYcS4WVN2EmbOU4w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yydg5/AYMc7XjMjl9UnQvFwYkvteg2VITyFQdFKFqoLfWXw93gc
 diaPSoXf8yMnXMh54HPs/lL7zvwSK1VugUH4kcbDGvC5NnTdyCkP
X-Google-Smtp-Source: AGHT+IGNwXAlJHaBXrnsGeXwGA4utGjnJr02l8IicuB7Vk/ooEjnqYAWwWmqFY6U2v0+nQynuABSkQ==
X-Received: by 2002:a05:6a00:3ccf:b0:71e:60d9:910d with SMTP id
 d2e1a72fcca58-7240c8b7bbemr916513b3a.6.1730975490635; 
 Thu, 07 Nov 2024 02:31:30 -0800 (PST)
Received: from [192.168.0.104] (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724078609ddsm1196578b3a.22.2024.11.07.02.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 02:31:30 -0800 (PST)
Message-ID: <21a00f02-7f2f-46da-a67f-be3e64019303@gmail.com>
Date: Thu, 7 Nov 2024 18:31:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20241106111930.218825-1-a0987203069@gmail.com>
 <20241106111930.218825-2-a0987203069@gmail.com>
 <f3c6b67f-5c15-43e2-832e-28392fbe52ec@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <f3c6b67f-5c15-43e2-832e-28392fbe52ec@lunn.ch>
X-Mailman-Approved-At: Wed, 20 Nov 2024 17:49:43 +0000
Cc: robh@kernel.org, conor+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 ychuang3@nuvoton.com, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 edumazet@google.com, joabreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 schung@nuvoton.com, kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, yclu4@nuvoton.com
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: net: nuvoton: Add schema
 for Nuvoton MA35 family GMAC
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

RGVhciBBbmRyZXcsCgpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCgpBbmRyZXcgTHVubiDmlrwg
MTEvNy8yMDI0IDI6MTMgQU0g5a+r6YGTOgo+PiArICBwaHktbW9kZToKPj4gKyAgICBlbnVtOgo+
PiArICAgICAgLSBybWlpCj4+ICsgICAgICAtIHJnbWlpLWlkCj4gVGhlIHBoeS1tb2RlIGRlZXBl
bmVkIG9uIHRoZSBib2FyZCBkZXNpZ24uIEFsbCBmb3VyIHJnbWlpIHZhbHVlcyBhcmUKPiB2YWxp
ZC4KSSB3aWxsIGFkZCB0aGVtLgo+PiArCj4+ICsgIHR4X2RlbGF5Ogo+PiArICAgIG1heEl0ZW1z
OiAxCj4+ICsgICAgZGVzY3JpcHRpb246Cj4+ICsgICAgICBDb250cm9sIHRyYW5zbWl0IGNsb2Nr
IHBhdGggZGVsYXkgaW4gbmFub3NlY29uZHMuCj4+ICsKPj4gKyAgcnhfZGVsYXk6Cj4+ICsgICAg
bWF4SXRlbXM6IDEKPj4gKyAgICBkZXNjcmlwdGlvbjoKPj4gKyAgICAgIENvbnRyb2wgcmVjZWl2
ZSBjbG9jayBwYXRoIGRlbGF5IGluIG5hbm9zZWNvbmRzLgo+IElmIHlvdSBhYnNvbHV0ZWx5IHJl
YWxseSBuZWVkIHRoZXNlLCBrZWVwIHRoZW0sIGJ1dCBpIHN1Z2dlc3QgeW91IGRyb3AKPiB0aGVt
LiBUaGV5IGp1c3QgY2F1c2UgY29uZnVzaW9uLCB3aGVuIGlkZWFsbHkgd2Ugd2FudCB0aGUgUEhZ
IHRvIGJlCj4gYWRkaW5nIFJHTUlJIGRlbGF5cywgbm90IHRoZSBNQUMuCj4KPiBJZiB5b3UgZG8g
bmVlZCB0aGVtLCB0aGVuIHRoZXkgc2hvdWxkIGJlIGluIHBTLgoKSSB3aWxsIGZpeCBpdC4KCldl
IGhhdmUgY3VzdG9tZXJzIHdobyB1c2UgYSBmaXhlZCBsaW5rIGluc3RlYWQgb2YgYSBQSFksIHNv
IHRoZXNlIApwcm9wZXJ0aWVzIG1heSBiZSBuZWNlc3NhcnkuCgo+IAlBbmRyZXcKClRoYW5rcyEK
CkJSLAoKSm9leQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
