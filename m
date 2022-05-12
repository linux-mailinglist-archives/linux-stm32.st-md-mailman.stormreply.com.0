Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA82527D84
	for <lists+linux-stm32@lfdr.de>; Mon, 16 May 2022 08:22:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEDF5C0D2BC;
	Mon, 16 May 2022 06:22:31 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5D61C035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 May 2022 19:49:10 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id w24so7515511edx.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 May 2022 12:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=L6bc/v2q9wAOZf+bsMrDYFkU4XW2OPwKGzrf/4IaxOw=;
 b=oKNxmUSRY97LZxvn4LykNJx9l+VNSrrOP9A+bFIG8JBTsJ3FgU/CvT38d3BaIHrCxM
 KJp1hc8RdA1O5jZStUVeiPgvhCr7z12dywOkUo/Gqljzg53oTRKpLT/mcCqQOggENFgm
 OAR9KGhGGh34eVHX3t8pd/N0zYk2/hZG8I9CIk/wyreDFJg9oTBUq8E2zVltYgE4HSW5
 OiS5JL667+4/2BIcIWhnGf6FVZ2O+CyE72gevQ1BqRaiNaTY/5jdwLmASD2g9Jaqe1xR
 4Wo02fzPqPL1kn4LFJHUH5zM/cYxMDYoCR3JVhDaQk3YskSW/2ctf2ALcMEn61IouzTI
 hXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=L6bc/v2q9wAOZf+bsMrDYFkU4XW2OPwKGzrf/4IaxOw=;
 b=0Po2hGrNU4KfOuQ8Kg9wspLjMQpYNF6jX5sRoo8U9ybW/Q8HtyOFcY9e0H00sbi0rg
 PrLs2FnvBFJYzF0Of9FbAzEJ5q1sAhFJwCtjg1XpPVeu+6re8hx1xG+iIL96qvtaH2OG
 NFt87f6kIZC2nqRxVyjzftG3+r9r2AwhYJwTNpTNbI44who4xwuC3ZJ5Znm7Jaw2rxAE
 z+9T+XgjlTNDRgUpLbiYjgjZY9eErG7W/j4OtdgCq86aZWnwku/IfgXjXeoQXnsTInJG
 3Ri0Z4ankdkzkyi2pAQ+kVex+QAgguBCQHVmbWNB8Rs5xQHSjAwMArk4/oK7t/jvV4JO
 AXKA==
X-Gm-Message-State: AOAM532wsdJvi+Gv9wRW6tB8wQ2RoVu1J6K6R4fuqBcmALe/3Qqib3DD
 UGWywHKW7bTKDd2nhehxbhV3N/I0OfPJtXP2N1Q=
X-Google-Smtp-Source: ABdhPJwZtff2PRHohfwpuQPnoqgF6843ayY4Y5H4s4QohcvBZEVKaooZLAQp+5U/kSShim+yChyf+HRSMyKwtvbzugc=
X-Received: by 2002:aa7:d954:0:b0:425:f621:f77f with SMTP id
 l20-20020aa7d954000000b00425f621f77fmr36567273eds.363.1652384950339; Thu, 12
 May 2022 12:49:10 -0700 (PDT)
MIME-Version: 1.0
From: Test Bot <zgrieee@gmail.com>
Date: Thu, 12 May 2022 23:48:59 +0400
Message-ID: <CAOFRbGnQ1P4q+egG+K=BcZL4bwaAdtp7hQ1nh9TYJyky0j3WDw@mail.gmail.com>
To: peppe.cavallaro@st.com, linux-kernel@vger.kernel.org
X-Mailman-Approved-At: Mon, 16 May 2022 06:22:30 +0000
Cc: ozgurk@ieee.org, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, davem@davemloft.net,
 linux@armlinux.org.uk
Subject: [Linux-stm32] ERROR: drivers: net: ethernet: stmicro: stmmac:
	stmmac_main.c
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

SGksCgpJIGF1dG9tYXRpY2FsbHkgdGVzdCAoUkMpIGtlcm5lbCBhbmQgY2F1Z2h0IEVSUk9SIHdv
cmQuClBsZWFzZSBpZ25vcmUsIGlmIGl0cyB1bmltcG9ydGFudC4KCktlcm5lbDogNS4xOC1yYzYK
QXJjaDogeDg2XzY0IChTTVApCkNvbXBpbGVyOiA3LjUuMCAoZ2NjKQpGSWxlOiBkcml2ZXJzL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCgpDb2RlYmFzZSBCbG9jazoK
CnN0YXRpYyBpbnQgc3RtbWFjX3JlcXVlc3RfaXJxX211bHRpX21zaShzdHJ1Y3QgbmV0X2Rldmlj
ZSAqZGV2KQp7CiAgICAgICAgc3RydWN0IHN0bW1hY19wcml2ICpwcml2ID0gbmV0ZGV2X3ByaXYo
ZGV2KTsKICAgICAgICBlbnVtIHJlcXVlc3RfaXJxX2VyciBpcnFfZXJyOwogICAgICAgIGNwdW1h
c2tfdCBjcHVfbWFzazsKICAgICAgICBpbnQgaXJxX2lkeCA9IDA7CiAgICAgICAgY2hhciAqaW50
X25hbWU7CiAgICAgICAgaW50IHJldDsKICAgICAgICBpbnQgaTsKCiAgICAgICAgaW50X25hbWUg
PSBwcml2LT5pbnRfbmFtZV9tYWM7CiAgICAgICAgc3ByaW50ZihpbnRfbmFtZSwgIiVzOiVzIiwg
ZGV2LT5uYW1lLCAibWFjIik7CiAgICAgICAgcmV0ID0gcmVxdWVzdF9pcnEoZGV2LT5pcnEsIHN0
bW1hY19tYWNfaW50ZXJydXB0LAogICAgICAgICAgICAgICAgICAgICAgICAgIDAsIGludF9uYW1l
LCBkZXYpOwoKICAgICAgICBpZiAodW5saWtlbHkocmV0IDwgMCkpIHsKICAgICAgICAgICAgICAg
IG5ldGRldl9lcnIocHJpdi0+ZGV2LAogICAgICAgICAgICAgICAgICAgICAgICAgICAiJXM6IGFs
bG9jIG1hYyBNU0kgJWQgKGVycm9yOiAlZClcbiIsCiAgICAgICAgICAgICAgICAgICAgICAgICAg
IF9fZnVuY19fLCBkZXYtPmlycSwgcmV0KTsKICAgICAgICAgICAgICAgIGlycV9lcnIgPSBSRVFf
SVJRX0VSUl9NQUM7CiAgICAgICAgICAgICAgICBnb3RvIGlycV9lcnJvcjsKICAgICAgICB9Cgog
ICAgICAgIGlmIChwcml2LT53b2xfaXJxID4gMCAmJiBwcml2LT53b2xfaXJxICE9IGRldi0+aXJx
KSB7CiAgICAgICAgICAgICAgICBpbnRfbmFtZSA9IHByaXYtPmludF9uYW1lX3dvbDsKICAgICAg
ICAgICAgICAgIHNwcmludGYoaW50X25hbWUsICIlczolcyIsIGRldi0+bmFtZSwgIndvbCIpOwog
ICAgICAgICAgICAgICAgcmV0ID0gcmVxdWVzdF9pcnEocHJpdi0+d29sX2lycSwKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0bW1hY19tYWNfaW50ZXJydXB0LAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgMCwgaW50X25hbWUsIGRldik7CgogICAgICAgICAgICAg
ICAgaWYgKHVubGlrZWx5KHJldCA8IDApKSB7CiAgICAgICAgICAgICAgICAgICAgICAgIG5ldGRl
dl9lcnIocHJpdi0+ZGV2LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIlczog
YWxsb2Mgd29sIE1TSSAlZCAoZXJyb3I6ICVkKVxuIiwKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBfX2Z1bmNfXywgcHJpdi0+d29sX2lycSwgcmV0KTsKICAgICAgICAgICAgICAg
ICAgICAgICAgaXJxX2VyciA9IFJFUV9JUlFfRVJSX1dPTDsKICAgICAgICAgICAgICAgICAgICAg
ICAgZ290byBpcnFfZXJyb3I7CiAgICAgICAgICAgICAgICB9CiAgICAgICAgfQoKQ29tcGlsZXIg
IExvZzoKCmRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmM6
IEluIGZ1bmN0aW9uCuKAmHN0bW1hY19yZXF1ZXN0X2lycV9tdWx0aV9tc2nigJk6CmRyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmM6MzU2MjoxOiB3YXJuaW5n
OiB0aGUKZnJhbWUgc2l6ZSBvZiAxMDQwIGJ5dGVzIGlzIGxhcmdlciB0aGFuIDEwMjQgYnl0ZXMK
Wy1XZnJhbWUtbGFyZ2VyLXRoYW49XQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
