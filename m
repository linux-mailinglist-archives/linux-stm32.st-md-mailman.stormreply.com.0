Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADE557EA0
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 10:49:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0345C8E65A
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 08:49:50 +0000 (UTC)
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D92C7C6C23B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2019 17:14:33 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id 34so1917147uar.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2019 10:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GR6x4on2th+OpGEr++2MdtxVD5WfNFN9wx4DvQ5w7Rc=;
 b=V8bIRrbAwIjB8y/e3VK5hdGQiO8fdK96fE89vK+8xM34pSYwtIAitElGMyEc8eEZ8Y
 JNN2Dm3GQX4EuHrYdTR03KQM7saTG0dG9xx5zg8ZkNjOfIr6ls5jeWmDIaheAotE/Yfs
 HELQdZl4/gheu42t/o9XX2Hh2YkYYtpBtob1vLOLhf9cgFBMV0rKwK8fnXV2suKtO/C4
 XaCv7FZXM2vP1vPi93jU4r/GnJzEFBq/C2BcDaw/yl5TkAlj+EOjsIQ+vkSq6f4v28Z8
 W3CDYr6Ag4umJu04mO2GC/WVWTh8HbyridbYuXZEfCtzeI4aRTnbJLsQ1DmiR9jSu4Ai
 gbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GR6x4on2th+OpGEr++2MdtxVD5WfNFN9wx4DvQ5w7Rc=;
 b=DPhO3zX0TzdUQ19syfISEEv4XkfMCnceOLqOuebu77hcCDeQw3GJJCc7mAHdGkLLoG
 AHZcRj5XGxuZby3pjVCg1mzlsaaTq+7iOpIPDyqcVy5E1pDnlG4g19kPeH62WJumexef
 AynmhbDnjzc1WaW07IRfUtQ6vJU9Hl1G8HbUvs/qYScYzOjQ02nj5PDMpOwuPKgSkvt6
 P0q3JmwJQEpJ3ARH2B0yrBy/8bWnzJepAwgJJM0oh7VpmbxrW3993rMhZRi68uNDWWRb
 HYHHrrFNh1eo52VSVoBMdDhR+JHIC3dNEsEztYyZ7klOHqyhqrCikwdpArJ396Bh2vn+
 LzVg==
X-Gm-Message-State: APjAAAXiPRRTIBwA5/KJWP3WB/I3jemzBDVfSGqaexV7lig7sI0TYCQJ
 CQb8z98vUO1MEXTRYxpTZE/jKOq4pbsIupC0Rsg=
X-Google-Smtp-Source: APXvYqy13gguR6NEUfCLLKpXnDy4AttZXqs4ykBs0SX9Cxiei5TfjAP35fuOn0fKJ5MLZcb+jT6s0DLzf4BvjOV0F9U=
X-Received: by 2002:ab0:2556:: with SMTP id l22mr9364887uan.46.1561050872751; 
 Thu, 20 Jun 2019 10:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <1560755897-5002-1-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1560755897-5002-1-git-send-email-yannick.fertre@st.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 20 Jun 2019 18:12:16 +0100
Message-ID: <CACvgo50vSNCTTTKp9D_07tazOE9YkU-zKAsDywvWe6h0NgcEmQ@mail.gmail.com>
To: =?UTF-8?Q?Yannick_Fertr=C3=A9?= <yannick.fertre@st.com>
X-Mailman-Approved-At: Thu, 27 Jun 2019 08:49:46 +0000
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 LAKML <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/3] drm/stm: drv: fix suspend/resume
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

SGkgWWFubmljaywKCk9uIE1vbiwgMTcgSnVuIDIwMTkgYXQgMDg6MTgsIFlhbm5pY2sgRmVydHLD
qSA8eWFubmljay5mZXJ0cmVAc3QuY29tPiB3cm90ZToKCj4gQEAgLTE1NSwxNSArMTU0LDE3IEBA
IHN0YXRpYyBfX21heWJlX3VudXNlZCBpbnQgZHJ2X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYp
Cj4gICAgICAgICBzdHJ1Y3QgbHRkY19kZXZpY2UgKmxkZXYgPSBkZGV2LT5kZXZfcHJpdmF0ZTsK
PiAgICAgICAgIGludCByZXQ7Cj4KPiArICAgICAgIGlmIChXQVJOX09OKCFsZGV2LT5zdXNwZW5k
X3N0YXRlKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4gKwo+ICAgICAgICAg
cG1fcnVudGltZV9mb3JjZV9yZXN1bWUoZGV2KTsKPiAgICAgICAgIHJldCA9IGRybV9hdG9taWNf
aGVscGVyX3Jlc3VtZShkZGV2LCBsZGV2LT5zdXNwZW5kX3N0YXRlKTsKPiAtICAgICAgIGlmIChy
ZXQpIHsKPiArICAgICAgIGlmIChyZXQpCkhtbSB0aGUgbXNtIGRyaXZlciB1c2VzICFyZXQgaGVy
ZS4gU3VzcGVjdGluZyB0aGF0IHlvdSB3YW50IHRoZSBzYW1lLAphbHRob3VnaCBJIGhhdmVuJ3Qg
Y2hlY2tlZCBpbiBkZXRhaWwuCgpIVEgKLUVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
