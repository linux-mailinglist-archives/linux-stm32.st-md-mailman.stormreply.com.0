Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 327B81E3A5F
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2020 09:28:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDE21C36B21;
	Wed, 27 May 2020 07:28:09 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20CE1C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 07:28:08 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id p21so11368932pgm.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 00:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PnARTlRhVkBUQkPqC454r4YU05zMHZz2LfM1l53WRb0=;
 b=j/De+h+QmNQ49bidmH96zLrOu2OBXrIIB6Y9QUEalQjZ1catzyle70SRBwOcwMWe+z
 iZIt54zFlbJqY6v33AGBhOtUxRV6Szu1l68EY9j0+rctjO15uFYPrWRUy3ghFb1xW7/H
 abClqYr3/WLdGWazduydiccGKMYgnyX/8lNoQoRJwJbpCE62LWArAo1EIY7SkaA1x3Hy
 nzV7QCUDYFaESm+gzjKIQGUvU0Na2CtsCyVwB+tlMQSf8mPIG7N0fY14a/SFd+dOWhAt
 0otXEMgwfJZ4aADjlvQwy4zZJ3PleE0M9x94oSgoEBNHkCtYi9ZFIcjq5FV59Ysyeooz
 E3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PnARTlRhVkBUQkPqC454r4YU05zMHZz2LfM1l53WRb0=;
 b=Hb6bN9Kv6geKDYVd2htjQK109PhzXGJcT0HR4wO0fl02YKn6fie/fWJ/ahtX9qZuKi
 lwtHDzzhEs2eUIVuWs8xwa4GtQumMSixgR8OSbMRuYfqRnOpzVtwhiqtwftPhcZfMARE
 vg2T+INOBqhnFNmFrhdjA0gF3wLy5AJl+YlRX5I4e2UW30boxRTiCHPc+4Z6BOKE/cBG
 NUxISJlLUcvCmuaZ6QI3XqrV2GjrXZwiE16dPX6BdifRggIwIbets0S6xFpI/lnaGwuG
 B+SJ3JTPaKlD3IJZKhNBW5F0EuZ4Ee/sozH32zcN1MQ75Z/5b9VrwpPu2HW2O12aq7qy
 AvXg==
X-Gm-Message-State: AOAM532kqlG8G5YMPwzqjLKBW4S/bdG1efwTa0AEFHJIOIN5iJYAAOue
 u45rk88TvqX69UkjXb7PF1s=
X-Google-Smtp-Source: ABdhPJx3SUGNW2XD8h8US9uScxTycxVHXeqpLbmx7fMrRID3k4oOipLAcBnlwkA/Q3ap+M2eKxw16w==
X-Received: by 2002:aa7:9ab6:: with SMTP id x22mr2661695pfi.136.1590564486694; 
 Wed, 27 May 2020 00:28:06 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id q201sm1371842pfq.40.2020.05.27.00.28.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 May 2020 00:28:06 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, mturquette@baylibre.com,
 sboyd@kernel.org, andy.shevchenko@gmail.com, noralf@tronnes.org,
 linus.walleij@linaro.org, broonie@kernel.org
Date: Wed, 27 May 2020 15:27:29 +0800
Message-Id: <1590564453-24499-6-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, dillonhua@gmail.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 5/9] clk: stm32: Fix stm32f429's ltdc
	driver hang in set clock rate
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

RnJvbTogZGlsbG9uIG1pbiA8ZGlsbG9uLm1pbmZlaUBnbWFpbC5jb20+CgpUaGlzIGlzIGR1ZSB0
byBtaXN1c2Ug4oCYUExMX1ZDT19TQUknIGFuZCdQTExfU0FJJyBpbiBjbGstc3RtMzJmNC5jCidQ
TExfU0FJJyBpcyAyLCAnUExMX1ZDT19TQUknIGlzIDcoZGVmaW5lZCBpbgppbmNsdWRlL2R0LWJp
bmRpbmdzL2Nsb2NrL3N0bTMyZngtY2xvY2suaCkuCgoncG9zdF9kaXYnIHBvaW50IHRvICdwb3N0
X2Rpdl9kYXRhW10nLCAncG9zdF9kaXYtPnBsbF9udW0nCmlzIFBMTF9JMlMgb3IgUExMX1NBSS4K
CidjbGtzW1BMTF9WQ09fU0FJXScgaGFzIHZhbGlkICdzdHJ1Y3QgY2xrX2h3KiAnIHJldHVybgpm
cm9tIHN0bTMyZjRfcmNjX3JlZ2lzdGVyX3BsbCgpIGJ1dCwgYXQgbGluZSAxNzc3IG9mCmRyaXZl
ci9jbGsvY2xrLXN0bTMyZjQuYywgdXNlIHRoZSAnY2xrc1twb3N0X2Rpdi0+cGxsX251bV0nLApl
cXVhbCB0byAnY2xrc1tQTExfU0FJXScsIHRoaXMgaXMgaW52YWxpZCBhcnJheSBtZW1iZXIgYXQg
dGhhdCB0aW1lLgoKRml4ZXM6IDUxNzYzM2VmNjMwZSAoImNsazogc3RtMzJmNDogQWRkIHBvc3Qg
ZGl2aXNvciBmb3IgSTJTICYgU0FJIFBMTHMiKQpTaWduZWQtb2ZmLWJ5OiBkaWxsb24gbWluIDxk
aWxsb24ubWluZmVpQGdtYWlsLmNvbT4KLS0tCgpIaSBTdGVwaGVuIEJveWQsCgpUaGlzIHVwZGF0
ZSBpbmNsdWRlIGJlbG93IGNoYW5nZXMgc2luY2UgVjUKMSBzZXBhcmF0ZSAnW1BBVENIIHY1IDUv
OF0nIHBhdGNoIHRvIHR3byBzdWJtaXRzCjIgZWFjaCBvbmUgaGFzIGEgRml4ZXMgdGFncwoKYmVz
dCByZWdhcmRzLgoKIGRyaXZlcnMvY2xrL2Nsay1zdG0zMmY0LmMgfCA2ICsrKy0tLQogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2Nsay9jbGstc3RtMzJmNC5jIGIvZHJpdmVycy9jbGsvY2xrLXN0bTMyZjQuYwppbmRl
eCAxODExN2NlNWZmODUuLjQyY2EyZGQ4NmFlYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9jbGsvY2xr
LXN0bTMyZjQuYworKysgYi9kcml2ZXJzL2Nsay9jbGstc3RtMzJmNC5jCkBAIC01NTcsMTMgKzU1
NywxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19kaXZfdGFibGUgcG9zdF9kaXZyX3RhYmxl
W10gPSB7CiAKICNkZWZpbmUgTUFYX1BPU1RfRElWIDMKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3Rt
MzJmNF9wbGxfcG9zdF9kaXZfZGF0YSAgcG9zdF9kaXZfZGF0YVtNQVhfUE9TVF9ESVZdID0gewot
CXsgQ0xLX0kyU1FfUERJViwgUExMX0kyUywgInBsbGkycy1xLWRpdiIsICJwbGxpMnMtcSIsCisJ
eyBDTEtfSTJTUV9QRElWLCBQTExfVkNPX0kyUywgInBsbGkycy1xLWRpdiIsICJwbGxpMnMtcSIs
CiAJCUNMS19TRVRfUkFURV9QQVJFTlQsIFNUTTMyRjRfUkNDX0RDS0NGR1IsIDAsIDUsIDAsIE5V
TEx9LAogCi0JeyBDTEtfU0FJUV9QRElWLCBQTExfU0FJLCAicGxsc2FpLXEtZGl2IiwgInBsbHNh
aS1xIiwKKwl7IENMS19TQUlRX1BESVYsIFBMTF9WQ09fU0FJLCAicGxsc2FpLXEtZGl2IiwgInBs
bHNhaS1xIiwKIAkJQ0xLX1NFVF9SQVRFX1BBUkVOVCwgU1RNMzJGNF9SQ0NfRENLQ0ZHUiwgOCwg
NSwgMCwgTlVMTCB9LAogCi0JeyBOT19JRFgsIFBMTF9TQUksICJwbGxzYWktci1kaXYiLCAicGxs
c2FpLXIiLCBDTEtfU0VUX1JBVEVfUEFSRU5ULAorCXsgTk9fSURYLCBQTExfVkNPX1NBSSwgInBs
bHNhaS1yLWRpdiIsICJwbGxzYWktciIsIENMS19TRVRfUkFURV9QQVJFTlQsCiAJCVNUTTMyRjRf
UkNDX0RDS0NGR1IsIDE2LCAyLCAwLCBwb3N0X2RpdnJfdGFibGUgfSwKIH07CiAKLS0gCjIuNy40
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
