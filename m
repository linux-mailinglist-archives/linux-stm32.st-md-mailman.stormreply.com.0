Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 105B43807EC
	for <lists+linux-stm32@lfdr.de>; Fri, 14 May 2021 13:02:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D277CC57B60;
	Fri, 14 May 2021 11:02:53 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C4F4C57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 May 2021 11:02:52 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id p6so177566plr.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 May 2021 04:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OOicQDUMq21UM0Ud7C95oVsNtJIeM7ZkfF7dwnsXfEg=;
 b=nQlQZxXGeUQ4gP81dPpiXkTEbHY/alLIvR5F6WhN+zlLpm6mPmYEsPD7dMTThV4qOy
 Lu3K3rLeKTHEacia78TX/Hdt2rBlb4lOQqAsQ4b+wijc3Ww/kT7uizjRXhS+P3q48+Cp
 dtLuqZEn2UJf5xt9LDMXNbeKj4hGfwbdnRWffqbp8Ronq3HXVKlM5rEOh4xRnVKzG/zN
 /6W2u1Iv8g3qfhH4mzed9kdG1ndtMCoaW3jTxXhHxv+Jlhmuw0dhqZE/u4zaQVk9kOHT
 1t6MtfHHeQ7ruu8j3Q3J+ITWWWkwWDS+Fn3itNosCln8R5qCcZ7J9HHiSs1Y0XgijcV+
 dRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OOicQDUMq21UM0Ud7C95oVsNtJIeM7ZkfF7dwnsXfEg=;
 b=LYIXfZTtUaq1nL7FM/JyZOv84GwxrwmTpL5z8PBRPLpWB+79bwfbBEzWy+cnczC2qh
 cSW/jE7kfygy/9pgTdAQOsGLaFIpSFj9avqJCOmqhzKssacoc79NktnP6ud6z1Gdh1KX
 NMeJkEt+cA0sNl4VyTx4jDlxjD8UfHNSg2ck4ehHAnbeM1b1THTajmojiGxPXaE4iMC6
 zzckX6CYs1kFcYftfEVk69DhXJkGN2PL0XOT5rhXZaa6r4DM2xXpNP9NaTaQ/9uJ+x7u
 xL55inHR1S/T7FcZ3aiDKMOdoIFBGPMhaTQyH0OGpsfv1Yd50sQ2YE1WdzppYVxGGVod
 Y9ug==
X-Gm-Message-State: AOAM532l2kcJNvX58Lp+Ff4LuQQXcieIZQvYXI7U9EG/gYlvdw0bsVo/
 z3d2yWzPkCAVpk3tx35NXQk=
X-Google-Smtp-Source: ABdhPJx0Ynnvv8lCfWgGxjHnaXYOCPih7/zTgEt/rhl7yOCbB0MgfG7zmIHpo+UWX7GF7sX1k5pYfA==
X-Received: by 2002:a17:90a:4092:: with SMTP id
 l18mr10534045pjg.35.1620990170835; 
 Fri, 14 May 2021 04:02:50 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id 202sm4193402pgg.59.2021.05.14.04.02.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 May 2021 04:02:50 -0700 (PDT)
From: dillon.minfei@gmail.com
To: patrice.chotard@foss.st.com, pierre-yves.mordret@foss.st.com,
 alain.volmat@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com, mturquette@baylibre.com
Date: Fri, 14 May 2021 19:02:31 +0800
Message-Id: <1620990152-19255-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620990152-19255-1-git-send-email-dillon.minfei@gmail.com>
References: <1620990152-19255-1-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Cc: sboyd@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 3/4] clk: stm32: Fix stm32f429's ltdc driver
	hang in set clock rate
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

RnJvbTogRGlsbG9uIE1pbiA8ZGlsbG9uLm1pbmZlaUBnbWFpbC5jb20+CgpUaGlzIGlzIGR1ZSB0
byBtaXN1c2Ug4oCYUExMX1ZDT19TQUknIGFuZCdQTExfU0FJJyBpbiBjbGstc3RtMzJmNC5jCidQ
TExfU0FJJyBpcyAyLCAnUExMX1ZDT19TQUknIGlzIDcoZGVmaW5lZCBpbgppbmNsdWRlL2R0LWJp
bmRpbmdzL2Nsb2NrL3N0bTMyZngtY2xvY2suaCkuCgoncG9zdF9kaXYnIHBvaW50IHRvICdwb3N0
X2Rpdl9kYXRhW10nLCAncG9zdF9kaXYtPnBsbF9udW0nCmlzIFBMTF9JMlMgb3IgUExMX1NBSS4K
CidjbGtzW1BMTF9WQ09fU0FJXScgaGFzIHZhbGlkICdzdHJ1Y3QgY2xrX2h3KiAnIHJldHVybgpm
cm9tIHN0bTMyZjRfcmNjX3JlZ2lzdGVyX3BsbCgpIGJ1dCwgYXQgbGluZSAxNzc3IG9mCmRyaXZl
ci9jbGsvY2xrLXN0bTMyZjQuYywgdXNlIHRoZSAnY2xrc1twb3N0X2Rpdi0+cGxsX251bV0nLApl
cXVhbCB0byAnY2xrc1tQTExfU0FJXScsIHRoaXMgaXMgaW52YWxpZCBhcnJheSBtZW1iZXIgYXQg
dGhhdCB0aW1lLgoKRml4ZXM6IDUxNzYzM2VmNjMwZSAoImNsazogc3RtMzJmNDogQWRkIHBvc3Qg
ZGl2aXNvciBmb3IgSTJTICYgU0FJIFBMTHMiKQpTaWduZWQtb2ZmLWJ5OiBEaWxsb24gTWluIDxk
aWxsb24ubWluZmVpQGdtYWlsLmNvbT4KQWNrZWQtYnk6IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2Vy
bmVsLm9yZz4KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC8x
NTkwNTY0NDUzLTI0NDk5LTYtZ2l0LXNlbmQtZW1haWwtZGlsbG9uLm1pbmZlaUBnbWFpbC5jb20v
Ci0tLQogZHJpdmVycy9jbGsvY2xrLXN0bTMyZjQuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Y2xrL2Nsay1zdG0zMmY0LmMgYi9kcml2ZXJzL2Nsay9jbGstc3RtMzJmNC5jCmluZGV4IDE4MTE3
Y2U1ZmY4NS4uNDJjYTJkZDg2YWVhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsay9jbGstc3RtMzJm
NC5jCisrKyBiL2RyaXZlcnMvY2xrL2Nsay1zdG0zMmY0LmMKQEAgLTU1NywxMyArNTU3LDEzIEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX2Rpdl90YWJsZSBwb3N0X2RpdnJfdGFibGVbXSA9IHsK
IAogI2RlZmluZSBNQVhfUE9TVF9ESVYgMwogc3RhdGljIGNvbnN0IHN0cnVjdCBzdG0zMmY0X3Bs
bF9wb3N0X2Rpdl9kYXRhICBwb3N0X2Rpdl9kYXRhW01BWF9QT1NUX0RJVl0gPSB7Ci0JeyBDTEtf
STJTUV9QRElWLCBQTExfSTJTLCAicGxsaTJzLXEtZGl2IiwgInBsbGkycy1xIiwKKwl7IENMS19J
MlNRX1BESVYsIFBMTF9WQ09fSTJTLCAicGxsaTJzLXEtZGl2IiwgInBsbGkycy1xIiwKIAkJQ0xL
X1NFVF9SQVRFX1BBUkVOVCwgU1RNMzJGNF9SQ0NfRENLQ0ZHUiwgMCwgNSwgMCwgTlVMTH0sCiAK
LQl7IENMS19TQUlRX1BESVYsIFBMTF9TQUksICJwbGxzYWktcS1kaXYiLCAicGxsc2FpLXEiLAor
CXsgQ0xLX1NBSVFfUERJViwgUExMX1ZDT19TQUksICJwbGxzYWktcS1kaXYiLCAicGxsc2FpLXEi
LAogCQlDTEtfU0VUX1JBVEVfUEFSRU5ULCBTVE0zMkY0X1JDQ19EQ0tDRkdSLCA4LCA1LCAwLCBO
VUxMIH0sCiAKLQl7IE5PX0lEWCwgUExMX1NBSSwgInBsbHNhaS1yLWRpdiIsICJwbGxzYWktciIs
IENMS19TRVRfUkFURV9QQVJFTlQsCisJeyBOT19JRFgsIFBMTF9WQ09fU0FJLCAicGxsc2FpLXIt
ZGl2IiwgInBsbHNhaS1yIiwgQ0xLX1NFVF9SQVRFX1BBUkVOVCwKIAkJU1RNMzJGNF9SQ0NfRENL
Q0ZHUiwgMTYsIDIsIDAsIHBvc3RfZGl2cl90YWJsZSB9LAogfTsKIAotLSAKMi43LjQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
