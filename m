Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7A719FFD
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2019 17:19:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D929BC9AE2B
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2019 15:19:17 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE0D8C9AE2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 15:19:16 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q15so3927756wmj.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 08:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=hfI45TE1I5uwK0Bfe/252jb7t90fCE1bIelVOQNQaUM=;
 b=hTSM6nL3NXhJDSGIenedVMXQCAahPRhCKQONbsUCkgElASVaWCoXoB/enwAMkt3HnW
 9yW7IpAGGEd/XrkSdUn70qhMdE7GjAlOnzRjg9V0B9RBCLHYdS1lagxRofNG4pBt4BoQ
 wxZtYN8A6k++tmlCAieXsGtjdnbtAm1xxlgrZyPrhQUAUmf9LQV/JlHzGLnGGIUTJiE/
 RfrnhNIItnQj4F/hWUel5GJxlmSnfvE8SmepuANJA1AgPYAZ+ww99Wr2IKK2iEMyG7qS
 WvhC3oaML3ks38p9YEBQQ7k2aT9F+QNw6j1UP3Q296UMFRpJJ6/wKAVIHkKOfq8/gm89
 soJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=hfI45TE1I5uwK0Bfe/252jb7t90fCE1bIelVOQNQaUM=;
 b=ElAbX/5DUzpr0nUXMShc4WZ1TZTx6cHeSLHXqa5DkJ5GRXVfL8B64yBK4dWeYJGFRi
 yTd/7pDyBxFgHMv5rRddhlrokvAdq4sWryCLK0oBeLtQE9gFwwM7tAz0UB3FVOOz6UUC
 bWgr5heBqSiOl2UnoDv5KTv2Rw3TH9uPqC8aq/Qlm+03XnXTZt9JR4rpd2qDk+/JFpx3
 J+r8/mQtatW5HBn+8UtPFyg6024o/OKcUCA0gcDnXPKikIQRpAulSQH2q9SWdRrMxv+l
 bJxTQMF913IWsuWHtfd3qKpht/rvShJBBCuwv6aGcnil/uukjX/Z9ALKIlwHSgpHRlQU
 6TRw==
X-Gm-Message-State: APjAAAXNcJT3YQRQRYU0OU99D2aE0aBOzvaeQKK/vVuoG0jc8a8kCz2P
 5xSrTnPoSyIDMnUcbTOxQtVWOw==
X-Google-Smtp-Source: APXvYqybXr+vcsOtoC6cNdTKe08GTN1LUn7gnJpq13Ga3bAoBaeBpdNLmgGY1GT+GtndyMTjIbD3zg==
X-Received: by 2002:a1c:a008:: with SMTP id j8mr7652413wme.73.1557501556269;
 Fri, 10 May 2019 08:19:16 -0700 (PDT)
Received: from dell ([2.27.167.43])
 by smtp.gmail.com with ESMTPSA id c131sm6807619wma.31.2019.05.10.08.19.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 May 2019 08:19:15 -0700 (PDT)
Date: Fri, 10 May 2019 16:19:12 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20190510151912.GB4319@dell>
References: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
 <20190510072314.GC7321@dell> <20190510151556.GA4319@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190510151556.GA4319@dell>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [GIT PULL v2] Immutable branch between MFD and
 Pinctrl due for the v5.2 merge window
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

Q2hhbmdlIG9mIHN1YmplY3QgbGluZSB0byB2MjoKCioqIENvbnRhaW5zIGZpeCBmb3IgaTM4NiBi
dWlsZCBicmVha2FnZSAqKgoKRW5qb3khCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29t
bWl0IGU5M2M5Yzk5YTYyOWM2MTgzN2Q1YTdmYzIxMjBjZDJiNmM3MGRiZGQ6CgogIExpbnV4IDUu
MSAoMjAxOS0wNS0wNSAxNzo0Mjo1OCAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCBy
ZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvbGVlL21mZC5naXQgdGFncy9pYi1tZmQtcGluY3RybC12NS4yLTEKCmZvciB5b3UgdG8g
ZmV0Y2ggY2hhbmdlcyB1cCB0byA5YWYyZGU3NjU3ZjVhNTJmOWUxNWFlYmI2ZjkzNDhmOWI4ZjI1
MGE2OgoKICBwaW5jdHJsOiBLY29uZmlnOiBGaXggU1RNRlggR1BJTyBleHBhbmRlciBQaW5jdHJs
L0dQSU8gZHJpdmVyIGRlcGVuZGVuY2llcyAoMjAxOS0wNS0xMCAxNjowOTo1NiArMDEwMCkKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KSW1tdXRhYmxlIGJyYW5jaCBiZXR3ZWVuIE1GRCBhbmQgUGluY3RybCBkdWUgZm9yIHRo
ZSB2NS4yIG1lcmdlIHdpbmRvdwoKQ29udGFpbnMgZml4IGZvciBpMzg2IGJ1aWxkIGJyZWFrYWdl
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCkFtZWxpZSBEZWxhdW5heSAoNSk6CiAgICAgIGR0LWJpbmRpbmdzOiBtZmQ6IEFk
ZCBTVCBNdWx0aS1GdW5jdGlvbiBlWHBhbmRlciAoU1RNRlgpIGNvcmUgYmluZGluZ3MKICAgICAg
bWZkOiBBZGQgU1QgTXVsdGktRnVuY3Rpb24gZVhwYW5kZXIgKFNUTUZYKSBjb3JlIGRyaXZlcgog
ICAgICBkdC1iaW5kaW5nczogcGluY3RybDogZG9jdW1lbnQgdGhlIFNUTUZYIHBpbmN0cmwgYmlu
ZGluZ3MKICAgICAgcGluY3RybDogQWRkIFNUTUZYIEdQSU8gZXhwYW5kZXIgUGluY3RybC9HUElP
IGRyaXZlcgogICAgICBwaW5jdHJsOiBLY29uZmlnOiBGaXggU1RNRlggR1BJTyBleHBhbmRlciBQ
aW5jdHJsL0dQSU8gZHJpdmVyIGRlcGVuZGVuY2llcwoKIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZmQvc3RtZngudHh0ICAgIHwgIDI4ICsKIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3BpbmN0cmwvcGluY3RybC1zdG1meC50eHQgIHwgMTE2ICsrKwogZHJpdmVycy9tZmQvS2Nv
bmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTMgKwogZHJpdmVycy9tZmQv
TWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMv
bWZkL3N0bWZ4LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNTQ1ICsrKysrKysr
KysrKysrCiBkcml2ZXJzL3BpbmN0cmwvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAxNCArCiBkcml2ZXJzL3BpbmN0cmwvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgMSArCiBkcml2ZXJzL3BpbmN0cmwvcGluY3RybC1zdG1meC5jICAgICAgICAgICAg
ICAgICAgICB8IDgyMCArKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvbGludXgvbWZkL3N0
bWZ4LmggICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTIzICsrKysKIDkgZmlsZXMgY2hhbmdl
ZCwgMTY2MSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zdG1meC50eHQKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9waW5j
dHJsLXN0bWZ4LnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWZkL3N0bWZ4LmMKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BpbmN0cmwvcGluY3RybC1zdG1meC5jCiBjcmVhdGUg
bW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tZmQvc3RtZnguaAoKLS0gCkxlZSBKb25lcyBb5p2O
55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3Bl
biBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwg
VHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
