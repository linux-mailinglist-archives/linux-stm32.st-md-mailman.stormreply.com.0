Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDA3691AAF
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Feb 2023 10:04:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B334C65E73;
	Fri, 10 Feb 2023 09:04:26 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BADF5C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Feb 2023 09:04:24 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id j25so4339480wrc.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Feb 2023 01:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=K7VIxGHRdprRV/LqkHIT4VXtM2nS0UlK2A3+S/yfPzU=;
 b=ruHL2ggkOLZrj/A1ju7AHyTWEpcP61OVgpgRcz6Ynbv3U4ENy0MTGWzkmzDKT0FKa+
 kxwheHnLfTF19VQElv5b7C1kTerLXF/Sm9dn8flXSppWr4feiaBjnIUZKoFuS3sq+aeG
 rTLF9/sYd300Yo+5rZHVLSIgWopIqp+Bib9SXMRFD+AxVmDzLKc5jP5o0blmC9/xXJ68
 H1y9bzuV045QH/lUvvffzQrH4bcqNX6nNfbco4wRboCCzBMKaV4X2OvFG+FlXVfgQ5O1
 hSuRClDFUoh8MethGF6L1kH1HmskaeVE64M+bpEuqtFF3Dn2UZYAtw+RNdd+ONTY+db4
 UZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K7VIxGHRdprRV/LqkHIT4VXtM2nS0UlK2A3+S/yfPzU=;
 b=4beDDktbOnxoUfmRc7hthpGRPCQFUEKMdXWTS0w8I4qdRWvEWWMR7vmL8OhIG06GvZ
 SoY6DFbQ+oX3nsqndoDnYxmkzvMU5gpDvV+V0GrgiNdCKEJusD5EGtFvdtnhhKVzEVl8
 ldOyUnSk989x9IOU56kvpH8tB22t+j9k1a/A3UZJUAZE2XWs67rqD+SWJTECcPfFzq0n
 TWtySBSv1m8O8phoe28nwEnXevBqsFNkGPZ4T3UlWRiNQIFWW2mE3ZqeJkLgUpUq5yNc
 qdf6XKrdT3nciSAq5SPkNCqGEJLpdGEDZrbpqkdtcW8lyr7bOg10H/tGjLw+/N8oMxRh
 w4Qw==
X-Gm-Message-State: AO0yUKUADYlSXwTGKQnZrtA9tdtLs40HvWoMdzwtadfjYnL9TBQSHszk
 MBwb9BX8RBaJT5w93ipTqH89mg==
X-Google-Smtp-Source: AK7set83noZf3enDbMTsBZDwxEicf2PTn9Yq7G9YrGZxZuCfxXPH0i2MIcZmQZROagL9Bdp3MbW7bg==
X-Received: by 2002:adf:f708:0:b0:2c5:3cd6:4fdf with SMTP id
 r8-20020adff708000000b002c53cd64fdfmr4285892wrp.39.1676019864173; 
 Fri, 10 Feb 2023 01:04:24 -0800 (PST)
Received: from linaro.org (wifi-eduroam-trans.univ-tlse3.fr. [195.220.58.237])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adfef4d000000b002c3db0eec5fsm3075177wrp.62.2023.02.10.01.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 01:04:23 -0800 (PST)
Date: Fri, 10 Feb 2023 10:04:20 +0100
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Alain Volmat <avolmat@me.com>
Message-ID: <20230210090420.GB175687@linaro.org>
References: <20230209091659.1409-1-avolmat@me.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230209091659.1409-1-avolmat@me.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Amit Kucheria <amitk@kernel.org>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, linux-doc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-pm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 00/11] ARM: removal of STiH415/STiH416
	remainings bits
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

T24gVGh1LCBGZWIgMDksIDIwMjMgYXQgMTA6MTY6NDhBTSArMDEwMCwgQWxhaW4gVm9sbWF0IHdy
b3RlOgo+IE1vc3Qgb2YgY29kZSBpbiBvcmRlciB0byBzdXBwb3J0IFNUaUg0MTUgYW5kIFNUaUg0
MTYgaGF2ZSBhbHJlYWR5Cj4gYmVlbiByZW1vdmVkIGZyb20gdGhlIGtlcm5lbCBpbiAyMDE2LCBo
b3dldmVyIGZldyBiaXRzIGFyZSBzdGlsbAo+IHJlbWFpbmluZ3MuCj4gVGhpcyBzZXJpZSByZW1v
dmVzIHRoZSBsYXN0IHBpZWNlcyBvZiBzdXBwb3J0IGZvciBTVGlINDE1LCBTVGlINDE2Cj4gYW5k
IFNUaUQxMjcuCgpIb3cgd291bGQgbGlrZSB0byBoYXZlIHRoZSBwYXRjaGVzIGFwcGxpZWQgPwoK
QWNrIGZyb20gdGhlIGRpZmZlcmVudCBtYWludGFpbmVycyBvciBlYWNoIG1haW50YWluZXIgYXBw
bHkgdGhlIHJlbGV2YW50IHBhdGNoZXMgPwoKVGhhbmtzCiAgLS0gRGFuaWVsCgotLSAKCiA8aHR0
cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUg
Zm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3Bh
Z2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4g
VHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
