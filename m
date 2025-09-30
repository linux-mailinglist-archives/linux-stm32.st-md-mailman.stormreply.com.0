Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CABBAC1C6
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Sep 2025 10:47:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB4F2C424CF;
	Tue, 30 Sep 2025 08:47:02 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C00AC424CF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 08:47:01 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-46e52279279so14936285e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 01:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759222021; x=1759826821;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HQSp6khD66PWakk86QjUyhjTSipaHZaw5SNW0wYKmlw=;
 b=TZ4ymKiBeEVo2Wn9sNhXKj8mNBomS8LeJnjZsqECbfKpGRQeDd3FUfdRHSkZ9dRkKJ
 FHU730kNWJk3vTROUL/RxlsAwQsc/m+UY4Wj7k7VpZg0KH4UiE0QXU/qAiNlc5WHTMVB
 A6sq5Ssym5MpSsp3X6pIy1nHEoFxFpd++dl5RXx6Dhl0Uoq93QDbUfBlg+Rxfd4UiASa
 zsftrD6h0+ZCakAe6tuVB8ezMYIxFZTN7cT0tBBppQD/ctCC/ggN0hItBGVesNcIZGqH
 NmuXbXP0CrgGnwpNMbANBtyTHdrG2BRCJk60hD2/LiUNMQ5aXmdRT9tBAbkKa07WWYDP
 M4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759222021; x=1759826821;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HQSp6khD66PWakk86QjUyhjTSipaHZaw5SNW0wYKmlw=;
 b=BDbEgjuyu28F79Q4IlIl9jRJCaoYh7neo2LXTCfXDS4dJy4wtNfcv4b7Wz2peus+5+
 /gEYd0+ozEZNWeYB3zroUjvYWoF6H3INIFDmGCxMAw4wtWi0RusbFrf6uvSF8pYOGhj1
 JOS0cGy1Mqubrj6iN8VempBsviC+/Wzis4u4B7RefeFXY1eh8WX9x3B3cM1iVh3seuwO
 /t9RXhjIOCWpfkQ5mU52/61qP60VukKfWaup8I1AnSs7IyH/U2CBPJyhze42UEoL5n9d
 wQS+bBs2pC5oMzuz65yoJu1PW/ha1McZ6hdBVm71UZ8yeViiFsYdND8iuP7uFF5QlyZM
 LRrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4IeTSL364TYL8tReHC4LADb4jK6o5ZQLGIN5MoIRYkWCYhNWKbjrn7Qj7nZqpDBY/I2A2WJ0R/Pv4UQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwOy6P/Ws0T4PKMsNTGiNKUn/rf2ayF9LRL1yN0vd9avWX8gz0T
 ifUlZ33M3d7+SQ/jmPrtgaF2GzJ1R7kMuoeiqA/ZMXLwuU/6T5rqMV3l
X-Gm-Gg: ASbGncu4xK5Totq6225kNLgOMG2Ps3ThfwGWKOE93DJKoGl2kPwL5WhhlLg/VGQHbBB
 jdKNDGbPf8GKwDh1EXB3jsam9F3qy5mOpHKwB2V4h7N2nytcthLifnZW82m5yYPhwk6r9BX/gYK
 ZvZA51iPqS5Izo6E3QVfehLqbvduOzW0Axv6ZcT1UqpTF6d+URaKxFF9DJ+3MZAjoakZi8Z6Iqm
 ajTurghlxyYLEYU9OVxOcL28E46sA9HcmsHrRviTOnKJaArA3l+Iu9NtxmPKMefwxGQulH1yOkD
 E6g7Eixq3xfmy1CbjzZM8cYaYTsLINlBu3nrdAylOGgoeWIitLh+SScUAdDuBFLtEedk+quD0Qb
 X+ouqo0+zkB4OV882gJMeYY2wM1LVtxvVyfDz0uExLpe5daHv8IxRmAPtZ99JWFxXKaw3tZILIT
 Ep0KVUrm6emwVe9AWH1paR9b1Zy0G6lU6tM9yVtVgK
X-Google-Smtp-Source: AGHT+IELjz8q9Wh4r7dTEajOLlhaehyVXuIINojrCEIqJ4/pZdMgPhXlF8x51ihCR4TA5ozMBPdmQw==
X-Received: by 2002:a5d:5f85:0:b0:3f9:1571:fdea with SMTP id
 ffacd0b85a97d-40e4cc630b2mr20809863f8f.44.1759222020801; 
 Tue, 30 Sep 2025 01:47:00 -0700 (PDT)
Received: from localhost (2a02-8440-7149-a758-f461-9bc4-1c75-ebc1.rev.sfr.net.
 [2a02:8440:7149:a758:f461:9bc4:1c75:ebc1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2a996e2fsm282983795e9.2.2025.09.30.01.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 01:47:00 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 30 Sep 2025 10:46:50 +0200
MIME-Version: 1.0
Message-Id: <20250930-b4-ddr-bindings-v8-7-fe4d8c015a50@gmail.com>
References: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
In-Reply-To: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
Cc: devicetree@vger.kernel.org,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v8 7/7] arm64: dts: st: add DDR channel to
 stm32mp257f-ev1 board
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

RnJvbTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgoK
QWRkIDMyYml0cyBERFI0IGNoYW5uZWwgdG8gdGhlIHN0bTMybXAyNTdmLWRrIGJvYXJkLgoKU2ln
bmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3Qu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGxlZ29mZmljLmNsZW1lbnRA
Z21haWwuY29tPgotLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0
cyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0cyBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0cwppbmRleCA4MzZiMTk1OGNlNjUuLmM0
MjIzZjA2Mzk2YSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU3
Zi1ldjEuZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0
cwpAQCAtNDEsNiArNDEsMTMgQEAgcGFkX2NsazogcGFkLWNsayB7CiAJCX07CiAJfTsKIAorCWRk
cl9jaGFubmVsOiBzZHJhbS1jaGFubmVsLTAgeworCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJ
I3NpemUtY2VsbHMgPSA8MD47CisJCWNvbXBhdGlibGUgPSAiamVkZWMsZGRyNC1jaGFubmVsIjsK
KwkJaW8td2lkdGggPSA8MzI+OworCX07CisKIAlpbXgzMzVfMnY5OiByZWd1bGF0b3ItMnY5IHsK
IAkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwogCQlyZWd1bGF0b3ItbmFtZSA9ICJp
bXgzMzUtYXZkZCI7CgotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
