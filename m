Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9B26331E1
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Nov 2022 02:08:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCEAAC65E40;
	Tue, 22 Nov 2022 01:08:14 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E35A4C03FE0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Nov 2022 01:08:09 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id x102so18671405ede.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 17:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=770v95sUrIlvtNLFG2ZFJPK2miGjPEzCsACcRdRH3P0=;
 b=tDoF3baarEZ/xbXDm7tk2HrsTGWpICgpqIAtSi03HywXzuaphjgJW54N71ewodQGgL
 W3DIwAOD1Z+BTxjyIkWFvBX4mFMnFV6j8xFwuUOGN12ePggI/v+RjoA02TWEeTP2sdUB
 b19ybRxEdtNpRoJbrGhyvTC63KxBZu0QuPH42XbY9BQ6XwdYDpUBkbYG9WVACRZguDXI
 uubWjH05gIC4oZ8NkoFPdw7iGNLrlZVwK13hQWmbYnFDT5k7s9ROcyPaUvx/rR96GmO+
 E3EWKEI7TuP6eoRMaarAKrk4dV5iR2Q08YMiomF6wF98eCjp67l9VMJ6TtBixdO9LbvS
 hztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=770v95sUrIlvtNLFG2ZFJPK2miGjPEzCsACcRdRH3P0=;
 b=pQeoSht7DSjwSr2CXJMznoj80nbmDZYnvUYNoVROgCoyvXy3GNzjlRtzlIlOri9dQV
 HyAbSqhlFOiB5SG7YT+sIbX+DcQnYcbg+TeCgKtP+clBIqGs2it+kcHvgh5KtXhCg5qu
 TCUhImHOBh7HTBjxAXl0HciYhWLlOVCIH122zXBV8FdWUBiEdnz4lja/fklMXgxoSuaV
 ppeAJXWxBoF4bVVntV7Uj/Geb6phmIIuGqUqLnAZvQCQe6ffr4su4f5JtiPim1kwjc0I
 BDDtBSRPpiSGkQD1df8dQCjjuI2pDUQwXMF8U2QSmqJWB55LuyQYSoiC4nOPlYRL7wD9
 5Wcw==
X-Gm-Message-State: ANoB5pmZK7j2oieYJyjUXq6HfOB/OWs1RhNPUwvgyRJ7hiC4PZh3up6k
 bAmV5GpuQfkX85tKca0gAv2IDg==
X-Google-Smtp-Source: AA0mqf6r3Zdf5ruet9qXDuVjd6GpPw7JVMSyJT9jBcH+eBdwhPNkdmCtSnW+kRAmDvWyunfZrvyPYQ==
X-Received: by 2002:a05:6402:3886:b0:463:ab08:2bc6 with SMTP id
 fd6-20020a056402388600b00463ab082bc6mr2102790edb.143.1669079289585; 
 Mon, 21 Nov 2022 17:08:09 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a1709064dcd00b007030c97ae62sm5514683ejw.191.2022.11.21.17.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 17:08:09 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Date: Tue, 22 Nov 2022 02:07:48 +0100
Message-Id: <20221122010753.3126828-3-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122010753.3126828-1-bero@baylibre.com>
References: <20221122010753.3126828-1-bero@baylibre.com>
MIME-Version: 1.0
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: [Linux-stm32] [PATCH v2 2/7] pinctrl: stm32: Remove check for
	pins-are-numbered
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

UmVtb3ZlIHRoZSBjaGVjayBmb3IgdGhlIHVubmVjZXNzYXJ5IHBpbnMtYXJlLW51bWJlcmVkCkRl
dmljZVRyZWUgcHJvcGVydHkKClNpZ25lZC1vZmYtYnk6IEJlcm5oYXJkIFJvc2Vua3LDpG56ZXIg
PGJlcm9AYmF5bGlicmUuY29tPgpSZXZpZXdlZC1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhp
YXMuYmdnQGdtYWlsLmNvbT4KQWNrZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRv
Zi5rb3psb3dza2lAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3Ry
bC1zdG0zMi5jIHwgNSAtLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL3N0bTMyL3BpbmN0cmwtc3RtMzIuYyBiL2RyaXZlcnMv
cGluY3RybC9zdG0zMi9waW5jdHJsLXN0bTMyLmMKaW5kZXggY2M5NDcyYjI4NDA0Ny4uMWNkZGNh
NTA2YWQ3ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9waW5jdHJsL3N0bTMyL3BpbmN0cmwtc3RtMzIu
YworKysgYi9kcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3RybC1zdG0zMi5jCkBAIC0xNDk5LDEx
ICsxNDk5LDYgQEAgaW50IHN0bTMyX3BjdGxfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIAlpZiAoIW1hdGNoX2RhdGEpCiAJCXJldHVybiAtRUlOVkFMOwogCi0JaWYgKCFkZXZp
Y2VfcHJvcGVydHlfcHJlc2VudChkZXYsICJwaW5zLWFyZS1udW1iZXJlZCIpKSB7Ci0JCWRldl9l
cnIoZGV2LCAib25seSBzdXBwb3J0IHBpbnMtYXJlLW51bWJlcmVkIGZvcm1hdFxuIik7Ci0JCXJl
dHVybiAtRUlOVkFMOwotCX0KLQogCXBjdGwgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKnBj
dGwpLCBHRlBfS0VSTkVMKTsKIAlpZiAoIXBjdGwpCiAJCXJldHVybiAtRU5PTUVNOwotLSAKMi4z
OC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
