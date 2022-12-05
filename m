Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A05642939
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Dec 2022 14:21:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21E89C65E60;
	Mon,  5 Dec 2022 13:21:40 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DE45C65067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Dec 2022 13:21:38 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id 124so11361984pfy.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Dec 2022 05:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9z1JhFIl54hhe1hJzAGSFqm4Ab0z60pwIOimmNR2/Lc=;
 b=bA7kTiuyMy0akuLe9I6Y5TgP9Gy1UA4+voCgPw03Dv31AGXnaMq3Tu3xCLVfTtBYuT
 BmEHqWRXfM4T0tjjyfH0OPzCnL56qn2UHFc63E/NNkDRq1UyeZ+LZcH5nSiRFJCcB1GU
 aWom9nox5uFGWQj8KSr7ur8u7qzEutw3B0+D32rFqRRV62cAXlUZdFHg6e8mDpao/8Vg
 iJkRjCgxZLp2Y7MtBQcwFlWMXcrEUllkujlYGIQOkZbpsS85kaD//C+49imHis3uiDNX
 jFB4Hwp/hOxExMtsTQtiqDVOD6l7M4SZ59B4NsAsAAEJvbXqyp0SRf5BFKM2opyA09di
 1Xyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9z1JhFIl54hhe1hJzAGSFqm4Ab0z60pwIOimmNR2/Lc=;
 b=UFPKs2KI4O41+uRivYbFBjbmpWCay4rG+uWkTr26iLvwzAo1Tp4KsmZ6NdXDt5E3dp
 J5TJYixmGgU340pAeywP/Hl3EbFe/k7IMHJiRmh7IN2pHo+QL/XZR722Il+T8eHuUlvH
 AnWzclTvaVJ2cL+f3l3DniyV1lJG5lvX2OuuUX+HGLTQ5YvKOX4OnBugGeKdqnjrS83l
 L2vgKovw2Du3sJTQxxmAFltA9qBHSDlofO3pZeFqK5/KCy4/qHRDiL0731SyqHdRZUXb
 ZrTT8WesdttyiSCVG54hZl+/Ia2iT3w5x5b+bzfU3DO+ILWeYlQSbtF2sq0oSU+W28Fx
 bvjg==
X-Gm-Message-State: ANoB5pkohIQUEOM+b6yolO7RVe5Q29nXUFtu0O5BqhXiaZo8BOUPk473
 v/Twyg6oSpNAzuORFEzy8eD+mg==
X-Google-Smtp-Source: AA0mqf7MiItBstwxtCl5bK9j7nFlFPOtd2lA9WFHspdb9k/DZyXPDYMrLQK0IU6wIzVKzqL9WVWUQw==
X-Received: by 2002:a63:4742:0:b0:478:cd7d:3f55 with SMTP id
 w2-20020a634742000000b00478cd7d3f55mr1407966pgk.624.1670246496752; 
 Mon, 05 Dec 2022 05:21:36 -0800 (PST)
Received: from localhost (63-228-113-140.tukw.qwest.net. [63.228.113.140])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a655942000000b00476c2180dbcsm8250956pgu.29.2022.12.05.05.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 05:21:36 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: alexandre.torgue@foss.st.com, Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?=
 <bero@baylibre.com>, devicetree@vger.kernel.org
In-Reply-To: <20221129023401.278780-8-bero@baylibre.com>
References: <20221129023401.278780-1-bero@baylibre.com>
 <20221129023401.278780-8-bero@baylibre.com>
Date: Mon, 05 Dec 2022 05:21:36 -0800
Message-ID: <7hlenm56lb.fsf@baylibre.com>
MIME-Version: 1.0
Cc: linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH v3 7/7] ARM: dts: stm32: Remove the
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

QWxleGFuZHJlLAoKQmVybmhhcmQgUm9zZW5rcsOkbnplciA8YmVyb0BiYXlsaWJyZS5jb20+IHdy
aXRlczoKCj4gUmVtb3ZlIHRoZSBwaW5zLWFyZS1udW1iZXJlZCBwcm9wZXJ0eSBmcm9tIFNUTTMy
IERldmljZVRyZWVzCj4KPiBTaWduZWQtb2ZmLWJ5OiBCZXJuaGFyZCBSb3Nlbmtyw6RuemVyIDxi
ZXJvQGJheWxpYnJlLmNvbT4KPiBSZXZpZXdlZC1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhp
YXMuYmdnQGdtYWlsLmNvbT4KCk5vdyB0aGF0IHRoZSBkcml2ZXIgJiBiaW5kaW5nIHFyZSBxdWV1
ZWQsIEknbSBhc3N1bWluZyB5b3UnbGwgcXVldWUgdGhpcwpvbmUgdmlhIHRoZSBzdG0zMiB0cmVl
PwoKVGhhbmtzLAoKS2V2aW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
