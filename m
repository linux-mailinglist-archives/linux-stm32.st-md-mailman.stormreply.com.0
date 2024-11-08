Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E992E9D417A
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 18:49:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A148C7A836;
	Wed, 20 Nov 2024 17:49:44 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0513C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Nov 2024 03:24:12 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-720be27db27so1321798b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Nov 2024 19:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731036251; x=1731641051;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FiQi+zVrti/4lwYHeXMzDjh6Y9tSUZHidpZ6r5DzMFs=;
 b=PBbgi3JUk9ke+rn6hND45fAINI1phJTyA6NwrP3gO6hBBKhmaMkBP5svKBX/NW7ePE
 faIujY0dvTRpXa92ShZC7G6HJZtfOKRrvIsvM/VTVTZ4I8XuM63bYEY1LzFa53xOVE47
 WkzD3Sn0yjqSsVRFEuTqmdM7fLUciG519KWQROdCDstQWy0MmkD3BjZ7GUo3hii3zqWn
 lS3uQRxU5TGu6k6zcR4pWhemisCme/um2U5QtL1yPmx9sE4JaXYSeG6rW2O7wI0n/bVO
 iVtpEJT2UPmsXL2CkUZo+IXrjZtDSlWOGdWQvPTxagORQaA+HYoaI8GIPIAqzbkBijcV
 3xfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731036251; x=1731641051;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FiQi+zVrti/4lwYHeXMzDjh6Y9tSUZHidpZ6r5DzMFs=;
 b=UzOjVvbANSkPnnWLQrbrVwv8gpNRe9P9h/xrRLWLNtcH31DI/+Q0o9ciadm0XEl/8N
 YuZlcQ2SrnQiLF8HRLzJgfTCsv+8x9nPoXDTQTjZQF+freKeTqycIau+eYG019GtxUih
 F+nXrQuayitXmUNBi4FucUXqxTEXBHVXVmBq36aDXfUazCT5/AY5LzsiSuhfQuUGLA1M
 XpzCf3iRAKjRQ0rYXOxlUla/HNzUC+Z4EGG2ZVzDoOzjVRjkNbuE0NTtyHqf2RdaZFdr
 2SKLAJPptCCQDramZNffEyOMzmsQ2CC8s+Iwf+2oxAettS7G8NBlQYTQlK8UioID8EJN
 nA5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFNkeYN4UGKqAjrYLTTkJt+YT6MkIzWlc1mWLCcOtenbwR85ZrPY4Vawe1JC6e75yaMIViWfGWf0xAVA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx+YuNwxygcSFMYe6PHVf3gtn4lWRSIKkehHS/y3ynOYc3H8ifB
 C8wW+h0BOhMy2KAs5YcOXgQLIvB+vmtdCbzRqyaqQDxNJNQUV4Tx
X-Google-Smtp-Source: AGHT+IEuCqDHEhTNFZCpyyg20d0b3Zu/p1XC6BTzBjuWov+1G8DqVUKH6K6wMKylQPRL5ggF5yB5RQ==
X-Received: by 2002:a05:6a00:1a89:b0:71e:4ee1:6d78 with SMTP id
 d2e1a72fcca58-7241327a424mr1559577b3a.1.1731036250950; 
 Thu, 07 Nov 2024 19:24:10 -0800 (PST)
Received: from [192.168.0.104] (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7240785fbe9sm2556540b3a.37.2024.11.07.19.24.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 19:24:10 -0800 (PST)
Message-ID: <7a476087-9efc-4271-bd2c-d04a0c1d0dff@gmail.com>
Date: Fri, 8 Nov 2024 11:24:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Conor Dooley <conor@kernel.org>
References: <20241106111930.218825-1-a0987203069@gmail.com>
 <20241106111930.218825-2-a0987203069@gmail.com>
 <20241106-bloated-ranch-be94506d360c@spud>
 <7c2f6af3-5686-452a-8d8a-191899b3d225@gmail.com>
 <20241107-slip-graceful-767507d20d1b@spud>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20241107-slip-graceful-767507d20d1b@spud>
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

CkNvbm9yIERvb2xleSDmlrwgMTEvOC8yMDI0IDE6MDkgQU0g5a+r6YGTOgo+IE9uIFRodSwgTm92
IDA3LCAyMDI0IGF0IDA2OjE1OjUxUE0gKzA4MDAsIEpvZXkgTHUgd3JvdGU6Cj4+IENvbm9yIERv
b2xleSDmlrwgMTEvNi8yMDI0IDExOjQ0IFBNIOWvq+mBkzoKPj4+IE9uIFdlZCwgTm92IDA2LCAy
MDI0IGF0IDA3OjE5OjI4UE0gKzA4MDAsIEpvZXkgTHUgd3JvdGU6Cj4+Pj4gKyAgbnV2b3Rvbixz
eXM6Cj4+Pj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFu
ZGxlCj4+Pj4gKyAgICBkZXNjcmlwdGlvbjogcGhhbmRsZSB0byBhY2Nlc3MgR0NSIChHbG9iYWwg
Q29udHJvbCBSZWdpc3RlcikgcmVnaXN0ZXJzLgo+Pj4gV2h5IGRvIHlvdSBuZWVkIGEgcGhhbmRs
ZSB0byB0aGlzPyBZb3UgYXBwZWFyIHRvIGhhdmUgbXVsdGlwbGUgZHdtYWNzIG9uCj4+PiB5b3Vy
IGRldmljZSBpZiB0aGUgZXhhbXBsZSBpcyBhbnl0aGluZyB0byBnbyBieSwgaG93IGNvbWUgeW91
IGRvbid0IG5lZWQKPj4+IHRvIGFjY2VzcyBkaWZmZXJlbnQgcG9ydGlvbnMgb2YgdGhpcyBkZXBl
bmRpbmcgb24gd2hpY2ggZHdtYWMgaW5zdGFuY2UKPj4+IHlvdSBhcmU/Cj4+IE9uIG91ciBwbGF0
Zm9ybSwgYSBzeXN0ZW0gcmVnaXN0ZXIgaXMgcmVxdWlyZWQgdG8gc3BlY2lmeSB0aGUgVFgvUlgg
Y2xvY2sKPj4gcGF0aCBkZWxheSBjb250cm9sLCBzd2l0Y2ggbW9kZXMgYmV0d2VlbiBSTUlJIGFu
ZCBSR01JSSwgYW5kIGNvbmZpZ3VyZSBvdGhlcgo+PiByZWxhdGVkIHNldHRpbmdzLgo+Pj4+ICsg
IHJlc2V0czoKPj4+PiArICAgIG1heEl0ZW1zOiAxCj4+Pj4gKwo+Pj4+ICsgIHJlc2V0LW5hbWVz
Ogo+Pj4+ICsgICAgaXRlbXM6Cj4+Pj4gKyAgICAgIC0gY29uc3Q6IHN0bW1hY2V0aAo+Pj4+ICsK
Pj4+PiArICBtYWMtaWQ6Cj4+Pj4gKyAgICBtYXhJdGVtczogMQo+Pj4+ICsgICAgZGVzY3JpcHRp
b246Cj4+Pj4gKyAgICAgIFRoZSBpbnRlcmZhY2Ugb2YgTUFDLgo+Pj4gQSB2ZW5kb3IgcHJlZml4
IGlzIHJlcXVpcmVkIGZvciBjdXN0b20gcHJvcGVydGllcywgYnV0IEkgZG9uJ3QgdGhpbmsgeW91
Cj4+PiBuZWVkIHRoaXMgYW5kIGFjdHVhbGx5IGl0IGlzIGEgYmFuZGFpZCBmb3Igc29tZSBvdGhl
ciBpbmZvcm1hdGlvbiB5b3UncmUKPj4+IG1pc3NpbmcuIFByb2JhYmx5IHJlbGF0ZWQgdG8geW91
ciBudXZvdG9uLHN5cyBwcm9wZXJ0eSBvbmx5IGJlaW5nIGEKPj4+IHBoYW5kbGUgd2l0aCBubyBh
cmd1bWVudHMuCj4+IFRoaXMgcHJvcGVydHkgd2lsbCBiZSByZW1vdmVkLgo+IEknbSBhbG1vc3Qg
Y2VydGFpbiB5b3UgY2FuJ3QganVzdCByZW1vdmUgdGhpcyBwcm9wZXJ0eSwgYmVjYXVzZSB5b3Ug
bmVlZAo+IGl0IHRvIHRlbGwgd2hpY2ggcG9ydGlvbiBvZiB0aGUgR0NSIGlzIGFwcGxpY2FibGUg
dG8gdGhlIGR3bWFjIGluc3RhbmNlCj4gaW4gcXVlc3Rpb24uIEluc3RlYWQsIHlvdSBuZWVkIHRv
IGFkIGFuIGFyZ3VtZW50IHRvIHlvdXIgcGhhbmRsZS4gVGhlCj4gc3RhcmZpdmUgZHdtYWMgYmlu
ZGluZy9kcml2ZXIgaGFzIGFuIGV4YW1wbGUgb2Ygd2hhdCB5b3UgY2FuIGRvLgoKWWVzLCBJIHdp
bGwgdXNlIHRoaXMgbWV0aG9kIGluc3RlYWQu8J+ZggoKbWFjLWlkIGFuZCB0eC9yeC1kZWxheSB3
aWxsIGJlIGFyZ3VtZW50cyBvZiBzeXNjb24uCgpUaGFua3MhCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
