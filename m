Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A26568F86B
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Feb 2023 20:54:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEC47C6A5E8;
	Wed,  8 Feb 2023 19:54:34 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 503DAC65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Feb 2023 19:54:33 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id u10so11104081wmj.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Feb 2023 11:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EBwPASl/5edIqKvU/JIFgLagE7/Ou6YlCS5upqg7x2Y=;
 b=ElaRHWbT/7/TFkvjy6RGL2e17EyHx++x8piD9HhzxfjPN7C6IjJr8KHQqMeSg3iRzn
 JGpO17rXoVb9C0s9qHFsCF+F1dXEfBZveWiAGHPo/FywF3QkBYc7IexMRDmAGf/yx8mm
 62bShvlBrZk/CP6VFbg2i2694PW2cGgn5Dpj4Aqza7z/CQemko/LeJmh7Wl+ZzeyCkJc
 txZM7BLVhLvjW4seK/N+hzNUnLLIcxm7PB3fNWjYU1aleGOUXkUP3VIjiUHcHMDjUf3r
 OKwaTESXnDBfnbQlzDQdqhyJHt4oLjsCUe2T3hW9PRIrn/gnopCojYZCNqLs0mj7k5P7
 7Tmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EBwPASl/5edIqKvU/JIFgLagE7/Ou6YlCS5upqg7x2Y=;
 b=p04QZtqnQ9N+wP6pMZmO4CPS8MetlQW/0Y2zKon5xOkn6W/rVWrs3h9TbE5S2/3uk2
 OAGcMW5Lf4Yy5Xeb1UVk6aWT2LpmQH8WCzWhvhNS/JK/IYZ761GOaRIfhruXXbwGAdlw
 SpzCd4GPXzuRBdYdqu0CPtikNdba/ozpSH9nYcbhC4mKDDhPadUnGe8Gg0QGsT3OKnge
 onJ0WTpst8KUtmnbEhuWRYjmfAUL7/iVh+AtOY81FtcaEagsblvmnMzu3n4H5RUHCHqd
 pMN03RLsjSPuJ4v6o2T++xHKGqcVaizAtRII9zqGFJmM9aPE0eLvXIvCY4d8MGGOTkox
 LkZQ==
X-Gm-Message-State: AO0yUKWaJRoOV4rrtcrl0W130e7QMOY+oYIwYQ/NRTgtu1W7h4P6NbNl
 FLhRWq2hhMez3pQIDaNYcz1gPw==
X-Google-Smtp-Source: AK7set+AS16QvAEzA43WSGcYuIpVX6rFu8GnlDVRV5HqJSp5kzSyNf3stjXk01gH7tABGuOR8dPMlA==
X-Received: by 2002:a05:600c:358b:b0:3df:9858:c02e with SMTP id
 p11-20020a05600c358b00b003df9858c02emr3319270wmq.3.1675886072898; 
 Wed, 08 Feb 2023 11:54:32 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b003dc34edacf8sm3260834wmq.31.2023.02.08.11.54.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 11:54:32 -0800 (PST)
Message-ID: <74240c25-cbbe-1e72-b56b-13124111b390@linaro.org>
Date: Wed, 8 Feb 2023 20:54:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Wong Vee Khee <veekhee@apple.com>,
 Kurt Kanzenbach <kurt@linutronix.de>,
 Revanth Kumar Uppala <ruppala@nvidia.com>,
 Tan Tee Min <tee.min.tan@linux.intel.com>
References: <20230208164203.378153-1-clement.leger@bootlin.com>
 <20230208164203.378153-7-clement.leger@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230208164203.378153-7-clement.leger@bootlin.com>
Cc: devicetree@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-renesas-soc@vger.kernel.org,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 Milan Stevanovic <milan.stevanovic@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=c3=a8l_Raynal?= <miquel.raynal@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>, Jimmy Lalande <jimmy.lalande@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 6/6] ARM: dts: r9a06g032:
	describe GMAC1
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

T24gMDgvMDIvMjAyMyAxNzo0MiwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+IFJaL04xIFNvQyBp
bmNsdWRlcyB0d28gTUFDIG5hbWVkIEdNQUN4IHRoYXQgYXJlIGNvbXBhdGlibGUgd2l0aCB0aGUK
PiAic25wcyxkd21hYyIgZHJpdmVyLiBHTUFDMSBpcyBjb25uZWN0ZWQgZGlyZWN0bHkgdG8gdGhl
IE1JSSBjb252ZXJ0ZXIKPiBwb3J0IDEuIFNpbmNlIHRoaXMgTUlJIGNvbnZlcnRlciBpcyByZXBy
ZXNlbnRlZCB1c2luZyBhIFBDUyBkcml2ZXIsIGl0Cj4gdXNlcyB0aGUgcmVuZXNhcyBzcGVjaWZp
YyBjb21wYXRpYmxlIGRyaXZlciB3aGljaCB1c2VzIHRoaXMgUENTLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IENsw6ltZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4KPiAtLS0KPiAg
YXJjaC9hcm0vYm9vdC9kdHMvcjlhMDZnMDMyLmR0c2kgfCAxOCArKysrKysrKysrKysrKysrKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vYm9vdC9kdHMvcjlhMDZnMDMyLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9yOWEwNmcw
MzIuZHRzaQo+IGluZGV4IDQxZTE5YzA5ODZjZS4uYmEzMmU0NDI5YjAxIDEwMDY0NAo+IC0tLSBh
L2FyY2gvYXJtL2Jvb3QvZHRzL3I5YTA2ZzAzMi5kdHNpCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9k
dHMvcjlhMDZnMDMyLmR0c2kKPiBAQCAtMzA0LDYgKzMwNCwyNCBAQCBkbWExOiBkbWEtY29udHJv
bGxlckA0MDEwNTAwMCB7Cj4gIAkJCWRhdGEtd2lkdGggPSA8OD47Cj4gIAkJfTsKPiAgCj4gKwkJ
Z21hYzE6IGV0aGVybmV0QDQ0MDAwMDAwIHsKPiArCQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5
YTA2ZzAzMi1nbWFjIiwgInJlbmVzYXMscnpuMS1nbWFjIiwgInNucHMsZHdtYWMiOwoKUGxlYXNl
IHRlc3QgeW91ciBEVFMgYWdhaW5zdCB0aGUgYmluZGluZyB5b3Ugc2VuZC4gSWYgeW91IGRpZCBp
dCwgeW91CndvdWxkIHNlZSBoZXJlIHRoYXQgdGhlIGJpbmRpbmcgZG9lcyBub3Qgd29yayBhbmQg
bmVlZHMgZml4ZXMuLi4gVGhlCmRpZmZlcmVuY2UgYmV0d2VlbiB5b3VyIERUUyBhbmQgeW91ciBl
eGFtcGxlIHNob3VsZCBhbHNvIHdhcm4geW91IHRoYXQKaXQncyBub3QgY29ycmVjdC4KCkJlc3Qg
cmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
