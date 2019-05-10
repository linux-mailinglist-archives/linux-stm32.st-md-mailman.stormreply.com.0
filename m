Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07546198F1
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2019 09:23:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E91DCC07A48
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2019 07:23:17 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E0F3C07A48
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 07:23:17 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 7so187914wmo.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 00:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=6IJvqYq4JZWD5aTcjw2ROgUsvIuulKVOwmPtVdRwUBw=;
 b=MLfJXEMdZmKpvWHQlqIzfyImp6Wy+KcsU0p5YvE1otyh3zIOF+I1vvQ/PJnC4diJpY
 sh7j6UBJ/0TsdJxDPFx15teFeEEP0QzxEIQEcUOhHwljvJCS2Tjkf/2mrXiP9/ZgNwHe
 CH4EkBxMqLQgUUoLVvHev0mv2XVIeQZeRZWtqthsJGrx+ZQjGkna1+4trW4eI+KMpWg/
 NqQgmANFTSZNHuEBAXzpXICTBex/HmPLIEN8E0Q2umUFYZfV9vf8qRqgiXOYJdB/lK+T
 nasc2eF4kXFxaiNB/WjJeNwU3qb9R9VMtLpc1FhwexCo5vE8Uqiyx1kEp0G2RSSP1FIm
 NJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=6IJvqYq4JZWD5aTcjw2ROgUsvIuulKVOwmPtVdRwUBw=;
 b=SRWjcKoKkZq7tHqKh7xYciExHz6K/L9gVOAr2kYBfo2BfROeDfDAq+zTdjOczLmMUL
 B66oQMduB982Y+9xBcGaVx/Vmlzi4fcG232Dmcg1PGYrYu8LZS5CoRRSnQWh2+BVSuGr
 BDkWC/rUD9RbKkrf4QTwEgl8cNLagayBP8sJe8p/hQBMRh7XiYqwElh693xkm2yKhbtk
 lCTCYK377XJnjCvZsSJGXkSR89cRnTaCDIGocHX3Lttufm/i3sJwz1MdHkKSPqF1AzsJ
 fAFa4u+QLP09ZteB0opxPe8PYLqr1ZzKEEj2x9vkORKbmM+kHzHxnGLj71HGqx8y49Mt
 DOxg==
X-Gm-Message-State: APjAAAUTPuQ0i3sYcZz2nrooKWW45a2+oMBHumEqAYlE0eMR62zAecSB
 6M/tpU0tg0a4UTMNJEJzAAzKXA==
X-Google-Smtp-Source: APXvYqwFI/XoRqh3l4hbVHQYN4vuu2sgvGQIfc1CDZPFb5/hfW20fNRJaFM/GapMBIrdKush+zwVEw==
X-Received: by 2002:a1c:7008:: with SMTP id l8mr5638463wmc.49.1557472996594;
 Fri, 10 May 2019 00:23:16 -0700 (PDT)
Received: from dell ([2.27.167.43])
 by smtp.gmail.com with ESMTPSA id n14sm1748514wrt.79.2019.05.10.00.23.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 May 2019 00:23:16 -0700 (PDT)
Date: Fri, 10 May 2019 08:23:14 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20190510072314.GC7321@dell>
References: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [GIT PULL] Immutable branch between MFD and Pinctrl
 due for the v5.2 merge window
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

RW5qb3khCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGU5M2M5Yzk5YTYyOWM2
MTgzN2Q1YTdmYzIxMjBjZDJiNmM3MGRiZGQ6CgogIExpbnV4IDUuMSAoMjAxOS0wNS0wNSAxNzo0
Mjo1OCAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBn
aXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbGVlL21mZC5naXQg
aWItbWZkLXBpbmN0cmwtdjUuMgoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDE0OTBk
OWY4NDFiMTg2NjY0ZjlkM2NhMjEzZGNmYTQ0NjRhNjA2ODA6CgogIHBpbmN0cmw6IEFkZCBTVE1G
WCBHUElPIGV4cGFuZGVyIFBpbmN0cmwvR1BJTyBkcml2ZXIgKDIwMTktMDUtMTAgMDg6MjE6MzEg
KzAxMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCkltbXV0YWJsZSBicmFuY2ggYmV0d2VlbiBNRkQgYW5kIFBpbmN0cmwg
ZHVlIGZvciB0aGUgdjUuMiBtZXJnZSB3aW5kb3cKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQW1lbGllIERlbGF1bmF5ICg0
KToKICAgICAgZHQtYmluZGluZ3M6IG1mZDogQWRkIFNUIE11bHRpLUZ1bmN0aW9uIGVYcGFuZGVy
IChTVE1GWCkgY29yZSBiaW5kaW5ncwogICAgICBtZmQ6IEFkZCBTVCBNdWx0aS1GdW5jdGlvbiBl
WHBhbmRlciAoU1RNRlgpIGNvcmUgZHJpdmVyCiAgICAgIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBk
b2N1bWVudCB0aGUgU1RNRlggcGluY3RybCBiaW5kaW5ncwogICAgICBwaW5jdHJsOiBBZGQgU1RN
RlggR1BJTyBleHBhbmRlciBQaW5jdHJsL0dQSU8gZHJpdmVyCgogRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21mZC9zdG1meC50eHQgICAgfCAgMjggKwogLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvcGluY3RybC9waW5jdHJsLXN0bWZ4LnR4dCAgfCAxMTYgKysrCiBkcml2ZXJzL21m
ZC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMyArCiBkcml2ZXJz
L21mZC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQogZHJp
dmVycy9tZmQvc3RtZnguYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA1NDUgKysr
KysrKysrKysrKysKIGRyaXZlcnMvcGluY3RybC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDEyICsKIGRyaXZlcnMvcGluY3RybC9NYWtlZmlsZSAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvcGluY3RybC9waW5jdHJsLXN0bWZ4LmMgICAgICAg
ICAgICAgICAgICAgIHwgODIwICsrKysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS9saW51eC9t
ZmQvc3RtZnguaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxMjMgKysrKwogOSBmaWxlcyBj
aGFuZ2VkLCAxNjU5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N0bWZ4LnR4dAogY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJs
L3BpbmN0cmwtc3RtZngudHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZmQvc3RtZngu
YwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcGluY3RybC9waW5jdHJsLXN0bWZ4LmMKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L21mZC9zdG1meC5oCgotLSAKTGVlIEpvbmVz
IFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKU
giBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJv
b2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
