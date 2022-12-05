Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E90E642931
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Dec 2022 14:20:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04876C65E60;
	Mon,  5 Dec 2022 13:20:37 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82D59C65067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Dec 2022 13:20:35 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id t17so11169070pjo.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Dec 2022 05:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VttxQNRn5wLcDZe0QBlfyaPIZnI+zBiatgv1ExvlsSA=;
 b=xSQoB37UuJKY4tgp5wdRFk+Jl7R8ZVhz7LrwXSbrbklLb9YmO/YJV3aWfjWuMzXxvj
 omoun5S6Ud66T3ElLc81i5TsPhZoAR39ojH/1Wi5QSdttzgYrmTsy/M4lIBg/B3IOetD
 h3immFNZ5DIsJUSfnVrO9h21CRqUHIJN/0LBiCEmBco61C1XqF4DCSnQhvABC3ephT/4
 t6YCxd/sJ5lVnZo36pg543Hs6D6FRmWspx4S9qqt3OQQzZxATzMCC0hOnzJxbyH+GkjI
 OHTDUczl1V59I2H72EN1VUfq/Tfhm3rHppWTPBzCK7D5gJz+f1cu9mH1cgy2xVjA5cdz
 6OFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VttxQNRn5wLcDZe0QBlfyaPIZnI+zBiatgv1ExvlsSA=;
 b=hEG6Ofyuv41vHOe24dDtCdHP8svpldaeM76jyAY3+t97UDMB8ucsInAi1jvk/2NMtA
 WptjX7acEdlfmpu9GV3pzez+MLFi5apvVWjVcFVZm3GtLAA808He92zF108VHbYTbCfH
 /jBVbc0c/JgO/Dk3uk6iEwqL1Va7oADDwBv6U4j64xdDVEDA25+l3QBPU8XsbH+LtCwt
 xTf44j2SKMGnD+DGVX5svb0xjzkY3nzCZs9WXKs5EqgbzVjumR2ERGj+IuyXMthfIs3b
 BFwcVWogoOVXOL6+3Qa7xX3pMNok1pusGynSqnxnLOSJnvhTX2g4iiIiPtwrhj8NKDVW
 ujYw==
X-Gm-Message-State: ANoB5plcSjZqwps2E893yOmLmQ/hrhoh51XX8KjdyhiDImrRgn5bTPyx
 sW2VDi5fIUgDfEsGqbXz/jDcAw==
X-Google-Smtp-Source: AA0mqf4PU5MhibxptEdBYx/Cd3SYioOJVCBMu5pSY3SfrC83bIr+4Og81l5n1VthaeXFLy+b7Gr+uw==
X-Received: by 2002:a17:90a:5298:b0:217:e054:9ac8 with SMTP id
 w24-20020a17090a529800b00217e0549ac8mr96191538pjh.246.1670246434046; 
 Mon, 05 Dec 2022 05:20:34 -0800 (PST)
Received: from localhost (63-228-113-140.tukw.qwest.net. [63.228.113.140])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a170902780700b001899007a721sm10496368pll.193.2022.12.05.05.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 05:20:33 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: matthias.bgg@gmail.com, Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?=
 <bero@baylibre.com>, devicetree@vger.kernel.org
In-Reply-To: <20221129023401.278780-6-bero@baylibre.com>
References: <20221129023401.278780-1-bero@baylibre.com>
 <20221129023401.278780-6-bero@baylibre.com>
Date: Mon, 05 Dec 2022 05:20:32 -0800
Message-ID: <7ho7si56n3.fsf@baylibre.com>
MIME-Version: 1.0
Cc: linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH v3 5/7] arm64: dts: mediatek: Remove
 pins-are-numbered property
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

TWF0dGhpYXMsCgpCZXJuaGFyZCBSb3Nlbmtyw6RuemVyIDxiZXJvQGJheWxpYnJlLmNvbT4gd3Jp
dGVzOgoKPiBSZW1vdmUgdGhlIHVubmVjZXNzYXJ5IHBpbnMtYXJlLW51bWJlcmVkIHByb3BlcnR5
IGZyb20KPiBhcm02NCBNZWRpYXRlayBEZXZpY2VUcmVlcwo+Cj4gU2lnbmVkLW9mZi1ieTogQmVy
bmhhcmQgUm9zZW5rcsOkbnplciA8YmVyb0BiYXlsaWJyZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFu
Z2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxh
Ym9yYS5jb20+Cj4gQWNrZWQtYnk6IEtldmluIEhpbG1hbiA8a2hpbG1hbkBiYXlsaWJyZS5jb20+
CgpOb3cgdGhhdCB0aGUgZHJpdmVyL2JpbmRpbmcgcGFydHMgYXJlIHF1ZXVlZCwgSSdtIGFzc3Vt
aW5nIHlvdSdsbCB0YWtlIHRoaXMgcGF0Y2gKKGFuZCBwYXRjaCA2KSB2aWEgdGhlIG1lZGlhdGVr
IHRyZWU/CgpUaGFua3MsCgpLZXZpbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
