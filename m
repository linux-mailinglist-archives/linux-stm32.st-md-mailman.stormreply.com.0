Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5806E3F9B
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Apr 2023 08:20:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51B99C6B455;
	Mon, 17 Apr 2023 06:20:09 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBFC7C6B453
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 06:20:07 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a5so4679647ejb.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Apr 2023 23:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681712407; x=1684304407;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cJzj86LhSJdAtbDEWAVBqUw/9fJfGhViwtTg9bTQuwI=;
 b=UwxNUHi1Q2SgXqIq3683UkBdctv5eKKX4T6cw2UjfsXc5YW6Z3PBE6NlPjLW6oVX8G
 kwN3WLBuMU05G6+iRNYz4AZAV6bHlfUVNFqrywbO0pBt8oD6KYzVcHpeWoGmx1hDTw2Z
 KDBCiGit5JahQBASnL1rzyGRy43I70DwwKGxJ2LI1rlRjLOC+s/4sO1GLMxjvOkb1b/T
 5+39CQS1xToB6e9McpvQoD7TYUklpGa9WnUh/ubH/roqVLknUgjocOXkSxqtFtXXR0PP
 dC31xa56ppER0VHU4Dpk+mo3NIAVMs1Nf0+pr4opnCQ2wUQ7Noh4n4hLAjs8xQFRm2bX
 ct0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681712407; x=1684304407;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cJzj86LhSJdAtbDEWAVBqUw/9fJfGhViwtTg9bTQuwI=;
 b=VysAjvNBaSvU5jRa/7835yY2o1ppmFFgkEkLkkYkZalCbN8OU5EpZ+SqwncsgTeM4l
 fOPc/qMJZydzyb/oHYMbFFNxtLbn6k5n2uRdqtVHzs4qR2slgrsJs/t86lZEoOPMe6MT
 SDRSnV40Wg/SkQ/RafsTcAG++/x9lYqjB2sfugP+w/YCSEMJVzI/F7GUYx1T5ajXDjWw
 ccks3eB5QGodeBPQE7HupxxSGyDBOF3BYjdJJ0zUo+L9ISYVpH5IqPc8GjkBOH7Prr6T
 HjafAcb16BQBSUxOiLF+VXTrO9yNeiiK/rV4IGS5+9eYUCwnOnOrBMh/Z5cbSMnVOtk0
 TJlg==
X-Gm-Message-State: AAQBX9fVDFJdLtdA2GPwcGywOmnOf27OQWlxoWr7H1WrPUkUjE6eFVQT
 VFdqi8R6KlrjQgCO/7vq1uDdjw==
X-Google-Smtp-Source: AKy350b8SXOaVHs71B0PzryL6gYZwUkAWF9/MWVAL9BYOIq7rQp8WPjgG4lUStlvKPn23FMl4BQA3g==
X-Received: by 2002:a17:907:a08d:b0:94f:8f37:d4e with SMTP id
 hu13-20020a170907a08d00b0094f8f370d4emr707144ejc.65.1681712407414; 
 Sun, 16 Apr 2023 23:20:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:b0ac:4d3b:966c:b33d?
 ([2a02:810d:15c0:828:b0ac:4d3b:966c:b33d])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a1709060c0f00b0094ca077c985sm6072788ejf.213.2023.04.16.23.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Apr 2023 23:20:06 -0700 (PDT)
Message-ID: <9edfca01-4191-8eca-32c6-c95f7c7601ae@linaro.org>
Date: Mon, 17 Apr 2023 08:20:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Sander Vanheule <sander@svanheule.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Julius Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Fu Wei <fu.wei@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Justin Chen <justinpopo6@gmail.com>, ?ecki <rafal@milecki.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 Corentin Labbe <clabbe@baylibre.com>, Anson Huang <Anson.Huang@nxp.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Jamie Iles <jamie@jamieiles.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
 Srinivas Neeli <srinivas.neeli@xilinx.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
 <20230415095112.51257-6-krzysztof.kozlowski@linaro.org>
 <75148300a158ceb0f86043535b089838e1d1bb61.camel@svanheule.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <75148300a158ceb0f86043535b089838e1d1bb61.camel@svanheule.net>
Subject: Re: [Linux-stm32] [PATCH 6/6] dt-bindings: watchdog: realtek,
 otto-wdt: simplify requiring interrupt-names
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

T24gMTYvMDQvMjAyMyAyMTowMCwgU2FuZGVyIFZhbmhldWxlIHdyb3RlOgo+IEhpIEtyenlzenRv
ZiwKPiAKPiBPbiBTYXQsIDIwMjMtMDQtMTUgYXQgMTE6NTEgKzAyMDAsIEtyenlzenRvZiBLb3ps
b3dza2kgd3JvdGU6Cj4+IFJlcXVpcmVkIHByb3BlcnRpZXMgc2hvdWxkIGJlIGxpc3RlZCBpbiAi
cmVxdWlyZWQ6IiBibG9jay7CoCBTaW5jZQo+PiBpbnRlcnJ1cHRzIGFyZSBhbHJlYWR5IHRoZXJl
LCB0aGUgZGVwZW5kZW5jeSBvZiBpbnRlcnJ1cHQtbmFtZXMgb24gdGhlCj4+IGludGVycnVwdHMg
Y2FuIGJlIHNpbXBsaWZpZWQuCj4gCj4gTWF5YmUgSSdtIG5vdCByZWFkaW5nIHRoaXMgcmlnaHQs
IGJ1dCBpc24ndCB0aGUgZGVwZW5kZW5jeSBzdGF0ZWQgaW4gdGhlIGJpbmRpbmcKPiAiaW50ZXJy
dXB0cyByZXF1aXJlcyBpbnRlcnJ1cHQtbmFtZXMgdG8gYmUgcHJlc2VudCI/IHJlc291cmNlLW5h
bWVzLnR4dAo+IGRlc2NyaWJlcyB0aGUgcmV2ZXJzZSBkZXBlbmRlbmN5ICgiaW50ZXJydXB0LW5h
bWVzIGlzIG9ubHkgbWVhbmluZ2Z1bCB3aXRoIGFuCj4gYXNzb2NpYXRlZCBpbnRlcnJ1cHRzIiku
CgpUaGUgaW50ZXJydXB0cyBhcmUgYWxyZWFkeSByZXF1aXJlZCBieSB0aGUgYmluZGluZywgc28g
dGhlIGRlcGVuZGVuY3ksCndoaWNoIG1ha2VzIGludGVycnVwdHMgZGVwZW5kaW5nIG9uIHByZXNl
bmNlIG9mIGludGVycnVwdC1uYW1lcywKZWZmZWN0aXZlbHkgd2FzIG1ha2luZyB0aGUgbmFtZXMg
cmVxdWlyZWQuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
