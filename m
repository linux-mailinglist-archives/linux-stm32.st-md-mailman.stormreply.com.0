Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BE86D29C8
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 23:07:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBAAAC69069;
	Fri, 31 Mar 2023 21:07:53 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E04B4C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 21:07:51 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 185so3035857pgc.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 14:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680296870; x=1682888870;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b3HBmEpRE2H5FpBYUp+3+9Ba8fJkZe2jGi9zQ9TL+bQ=;
 b=W789RceUy8yw1kmhSKR4L5nPOIoAT3j88Yf2vZLzGDSOKDFs8+WB3FKKBLvSNDsvpg
 5yBxh6cHNeNV4d9Co77o6M93ilUKffiHQQA5DGe5KaDB4ab/QkQON6uY1MwWcwJT49Lb
 SttW+5/pBvEal8cv5/iMRqbzAn6Os/yaxNIcdGhouK78bicF3ACG8XcMZd9ekA9V6ugt
 a+RfhCadtDECM9RUZigUSV0QLHClHF7DTypl5S/WCPa5DLOimseRYoBaTml98jUztxsR
 q/du97bxRyu9X4dLA3P2gUMVh/tdsGRxG4cW+Ajr8EJa8NoGbaI4XOoMNSLmOMyAlh82
 1/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680296870; x=1682888870;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b3HBmEpRE2H5FpBYUp+3+9Ba8fJkZe2jGi9zQ9TL+bQ=;
 b=uQhxJoBf1TKumYgjWc0U+8ZVfMoD725vHFlLL0wQIDxYMkCZf1hS/cGIRY6aFjfykR
 XGF6XGDjSzH6+DZelp8rzK8ATIpG+pFtzEfNs7kqyJ6/0UYMdFliH06TH8xk+ZcB3PVi
 X/xhURmV4+xZVFk2z0+1kgc9KTzxpToWLu3yr+xu7P7+ujk6j88QKE0Z7XT+w1xbgL+d
 pcM0YXUWUw7UD2bqLMBaFlKYOW4bxo4Os6AAhKcdTXQ+PUqwjayx7BRq4Y6/fYBNztPe
 +PEMTNWQCFO6fiFOQ97gVgUc8sVf5Cu6TQqbCdb8VWrky3r/Zv+ZwpVPRv9DdV+QAxWT
 J+UQ==
X-Gm-Message-State: AAQBX9dYXaXQSKFBrvwXRTcacxYw57Co1ukZeXSs7W1BWt9uFo58T6gT
 vpZUUFQNaR1hZuZ3uXvFc9Qn6/GIqunpfown9UU=
X-Google-Smtp-Source: AKy350anRsfCLJkK+6go7iAS3sjtY50Uy4g6rt48MvbV6wCnxfGDtJ+/VnYLuDaAHD/e9L+vh5drPrTUww+Yab2/Nno=
X-Received: by 2002:a63:582:0:b0:513:a9b2:9612 with SMTP id
 124-20020a630582000000b00513a9b29612mr1935357pgf.6.1680296870327; Fri, 31 Mar
 2023 14:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230331205759.92309-1-shenwei.wang@nxp.com>
 <20230331205759.92309-2-shenwei.wang@nxp.com>
In-Reply-To: <20230331205759.92309-2-shenwei.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 31 Mar 2023 18:07:38 -0300
Message-ID: <CAOMZO5BwVWCMyiFG+HbjxeSvo+8x+1JtSmLmLmXWrWrsg6Cc7A@mail.gmail.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, imx@lists.linux.dev,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, netdev@vger.kernel.org,
 Wong Vee Khee <veekhee@apple.com>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Revanth Kumar Uppala <ruppala@nvidia.com>, Paolo Abeni <pabeni@redhat.com>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org,
 Tan Tee Min <tee.min.tan@linux.intel.com>
Subject: Re: [Linux-stm32] [PATCH v3 2/2] net: stmmac: dwmac-imx: use
 platform specific reset for imx93 SoCs
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

SGkgU2hlbndlaSwKCk9uIEZyaSwgTWFyIDMxLCAyMDIzIGF0IDU6NTjigK9QTSBTaGVud2VpIFdh
bmcgPHNoZW53ZWkud2FuZ0BueHAuY29tPiB3cm90ZToKPgo+IFRoZSBwYXRjaCBhZGRyZXNzZXMg
YW4gaXNzdWUgd2l0aCB0aGUgcmVzZXQgbG9naWMgb24gdGhlIGkuTVg5MyBTb0MsIHdoaWNoCj4g
cmVxdWlyZXMgY29uZmlndXJhdGlvbiBvZiB0aGUgY29ycmVjdCBpbnRlcmZhY2Ugc3BlZWQgdW5k
ZXIgUk1JSSBtb2RlIHRvCj4gY29tcGxldGUgdGhlIHJlc2V0LiBUaGUgcGF0Y2ggaW1wbGVtZW50
cyBhIGZpeF9zb2NfcmVzZXQgZnVuY3Rpb24gYW5kIHVzZXMKPiBpdCBzcGVjaWZpY2FsbHkgZm9y
IHRoZSBpLk1YOTMgU29Dcy4KPgo+IFNpZ25lZC1vZmYtYnk6IFNoZW53ZWkgV2FuZyA8c2hlbndl
aS53YW5nQG54cC5jb20+Cj4gLS0tCj4gIC4uLi9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
ZHdtYWMtaW14LmMgICB8IDI5ICsrKysrKysrKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDI4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1pbXguYyBiL2RyaXZlcnMvbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWlteC5jCj4gaW5kZXggYWM4NTgwZjUwMWUyLi4z
ZGZkMTM4NDA1MzUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvZHdtYWMtaW14LmMKPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9kd21hYy1pbXguYwo+IEBAIC0xOSw5ICsxOSw5IEBACj4gICNpbmNsdWRlIDxsaW51eC9w
bV93YWtlaXJxLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KPiAgI2luY2x1ZGUgPGxp
bnV4L3NsYWIuaD4KPiAtI2luY2x1ZGUgPGxpbnV4L3N0bW1hYy5oPgo+Cj4gICNpbmNsdWRlICJz
dG1tYWNfcGxhdGZvcm0uaCIKPiArI2luY2x1ZGUgImNvbW1vbi5oIgoKVGhlc2UgY2hhbmdlcyBp
biB0aGUgaGVhZGVyIHNlZW0gdG8gYmUgdW5yZWxhdGVkLgoKQXBhcnQgZnJvbSB0aGF0OgoKUmV2
aWV3ZWQtYnk6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
