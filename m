Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1164A3448D7
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Mar 2021 16:11:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA41AC57B5E;
	Mon, 22 Mar 2021 15:10:59 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E076C5662E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Mar 2021 15:10:56 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id h13so19786363eds.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Mar 2021 08:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=BblDdmrktMK5tFFD4LOpFP77ijBklviaU26xu4C63tQ=;
 b=IT2iGJQyBA7Y1+dCJvTIJziErQmWcbn0+kMr4Y273pDNqodHvB6Ww7nGeAozLlDj16
 AaZFlWmlmAzS7zUACjHtiaCrXpOhiRROiQFyU4auZ+13hpjjdqVYNePQ5Cyp/9DkkrQC
 b91OFvMWYHKs9MAA7wM3CC0WQRuzxtVRw66hiamNYNrYJOlJE43oIsVGuMZ9kLPAqUbQ
 nynbvcEhIJeX2PlbMuKhnlTT65dd9GDFO83TYP0QzGcN6dLgdO2DDjR1KDBGvGzAifvT
 3iM6ErE3HQUX/Nd9uR6OnpKDyBISmiXqsi9ileg7sykq6tbAiP06wPIgKKPW7GTaZvHL
 iZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BblDdmrktMK5tFFD4LOpFP77ijBklviaU26xu4C63tQ=;
 b=WOwmCB61wvGJgiC/0LVD4LFXtOPuUAeSBvZp72Oo+uL1jEP6Z0ME/ey8eeilZpxcHa
 IB1mieo4RjVMPGFaGqqyvql4fDeNF72CUyXxhFbBx+mJMs7/xuMxtlF/CkGqW6iGJ9Ys
 cMejhaiUcY2nnKnjj9qMMni9Xzq+4/A19feirUFXwZVxLS5nqzeq2lfkNrYp0WEdoP2P
 M4VmvIOtZeO6i+1O8R/vzy5dvPgRCOm1e9PN/vipAT//Y3Fqn5qEwpYxusgKM8lxLWgK
 N3Q0pk10Uljc9f/8XKGF0c1KyWB3SxZmysd21MqpIDFVCeegRt72hjGIR0RUIDfy7N4O
 f6Bw==
X-Gm-Message-State: AOAM530HWl06bQQfD9tOTXLnWlf0vQ7WqqDoSqOa9vLVsW7cw5HvKQVK
 2m+DLpkMByATdX5XYTt/vE3gnQ==
X-Google-Smtp-Source: ABdhPJwxMVa4A4qij3tXD3Epc4EsEgsbfdMWBHLOdKIarJBUoxpk8xvIYdSjs+oVvVNjC/1HEN64aQ==
X-Received: by 2002:a05:6402:22b5:: with SMTP id
 cx21mr26421224edb.27.1616425856228; 
 Mon, 22 Mar 2021 08:10:56 -0700 (PDT)
Received: from dell ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id e4sm9768413ejz.4.2021.03.22.08.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 08:10:55 -0700 (PDT)
Date: Mon, 22 Mar 2021 15:10:53 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <20210322151053.GB2916463@dell>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
 <20210311152545.1317581-4-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210311152545.1317581-4-krzysztof.kozlowski@canonical.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-i2c@vger.kernel.org,
 Will Deacon <will@kernel.org>, linux-clk@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Tom Rix <trix@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-fpga@vger.kernel.org,
 devicetree@vger.kernel.org, Robert Richter <rric@kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>,
 dmaengine@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Moritz Fischer <mdf@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 James Morse <james.morse@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Olof Johansson <olof@lixom.net>, Borislav Petkov <bp@alien8.de>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 03/15] mfd: altera: merge ARCH_SOCFPGA
 and ARCH_STRATIX10
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

T24gVGh1LCAxMSBNYXIgMjAyMSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKCj4gU2ltcGxp
ZnkgMzItYml0IGFuZCA2NC1iaXQgSW50ZWwgU29DRlBHQSBLY29uZmlnIG9wdGlvbnMgYnkgaGF2
aW5nIG9ubHkKPiBvbmUgZm9yIGJvdGggb2YgdGhlbS4gIFRoaXMgdGhlIGNvbW1vbiBwcmFjdGlj
ZSBmb3Igb3RoZXIgcGxhdGZvcm1zLgo+IEFkZGl0aW9uYWxseSwgdGhlIEFSQ0hfU09DRlBHQSBp
cyB0b28gZ2VuZXJpYyBhcyBTb0NGUEdBIGRlc2lnbnMgY29tZQo+IGZyb20gbXVsdGlwbGUgdmVu
ZG9ycy4KPiAKPiBUaGUgc2lkZSBlZmZlY3QgaXMgdGhhdCB0aGUgTUZEX0FMVEVSQV9BMTBTUiB3
aWxsIG5vdyBiZSBhdmFpbGFibGUgZm9yCj4gYm90aCAzMi1iaXQgYW5kIDY0LWJpdCBJbnRlbCBT
b0NGUEdBLCBldmVuIHRob3VnaCBpdCBpcyB1c2VkIG9ubHkgZm9yCj4gMzItYml0Lgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fu
b25pY2FsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tZmQvS2NvbmZpZyB8IDQgKystLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKQWNrZWQtYnk6IExl
ZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9d
ClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKU
giBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJv
b2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
