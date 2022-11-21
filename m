Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5F7632BF6
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 19:20:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EA76C64104;
	Mon, 21 Nov 2022 18:20:32 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30308C03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 18:20:31 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso11466625pjt.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 10:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rUvU6OEfSgOgV90lNE3OyREzRIMADu+N0DuF09M2GsU=;
 b=SgPkuMF1IJePZ4kDlRVVEA1//qeMWY6/d1jeHFNWADKG121aZfE1BFujlvCNdfZWdk
 06Cfk5rcY9ULQhTkMePwP0Z4gfB4qbW3D9idqcBiCRnELk48IrE6ZBoINn94+a3GPCgC
 NVYeLbw6jUuhACSDWLCr3+Ql7HE8uhV3uDLHsPRNuvL6zSxUo9BJiDIc/W/KcCugBPx5
 L0+xh175q906enpGR71opBGd6OMaubX1WzZfGPSIlgKInbRbKoVCVLfQKQTZFi2hITza
 NIpZB3ZkKH574Y6OQpmTmJ3ZFsiVUD7PFfPowhfS/U1Y6figkt/vtTIe05NMNvVGtt8f
 5UZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rUvU6OEfSgOgV90lNE3OyREzRIMADu+N0DuF09M2GsU=;
 b=F9JjGBiVHrehrsevrU6x+MKYn4tloi3dHXecZaAzMhNn3b/D+M5kfMDDE6OZee+W/Z
 ADWHUCbYhW42HYi1HhAVxTFhcYaeAtR5R0l3e2ip7wzDBqgqRH3PGsVMVRQouBNnXK5T
 +o9Y8/Td9lOBC98C96u/NRSbPSDM+b7OBfU9vZ/p0LTXf5cm0gdZL0Iy6Mj25ZQsijlV
 ZsVCAitHU4UtUM871qFLxNKnQvUqzXnnpu4hFbmFObBivdo/LBFn5xszTOUhdqRHU0cy
 UYdmf9yZxvHXHsHTQgWSMdvHGGubTzO/WalI06N1N+tCE3tmhql/8cvgg5QN2fDiZzvE
 lP/A==
X-Gm-Message-State: ANoB5pm9kuAT81pkhR/rhk+vC8w2Ee1LMncbH2Bo6er/e3ULFmAOInA+
 fCJXSdG3yKen4xWmQ1XZa8NjMA==
X-Google-Smtp-Source: AA0mqf7yyP1/YcozCO+5/Ps6F02tyWRvSUU8z+Ribfe8dzDyGQaPbidQBPZAtOYeirhiKku32is/WA==
X-Received: by 2002:a17:90a:7e87:b0:212:f810:a846 with SMTP id
 j7-20020a17090a7e8700b00212f810a846mr28500649pjl.71.1669054829597; 
 Mon, 21 Nov 2022 10:20:29 -0800 (PST)
Received: from localhost ([75.172.139.56]) by smtp.gmail.com with ESMTPSA id
 d125-20020a623683000000b0056da8c41bbasm8956905pfa.161.2022.11.21.10.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 10:20:28 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
In-Reply-To: <20221121015451.2471196-2-bero@baylibre.com>
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-2-bero@baylibre.com>
Date: Mon, 21 Nov 2022 10:20:28 -0800
Message-ID: <7hv8n88903.fsf@baylibre.com>
MIME-Version: 1.0
Cc: krzysztof.kozlowski@linaro.org, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/9] pinctrl: mediatek: common: Remove
 check for pins-are-numbered
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

QmVybmhhcmQgUm9zZW5rcsOkbnplciA8YmVyb0BiYXlsaWJyZS5jb20+IHdyaXRlczoKCj4gUmVt
b3ZlIHRoZSBjaGVjayBmb3IgdGhlIHVubmVjZXNzYXJ5IHBpbnMtYXJlLW51bWJlcmVkIERldmlj
ZXRyZWUgcHJvcGVydHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCZXJuaGFyZCBSb3Nlbmtyw6RuemVy
IDxiZXJvQGJheWxpYnJlLmNvbT4KCkFja2VkLWJ5OiBLZXZpbiBIaWxtYW4gPGtoaWxtYW5AYmF5
bGlicmUuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
