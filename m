Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F23723D7C
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Jun 2023 11:31:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B7ABC6905A;
	Tue,  6 Jun 2023 09:31:04 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1545EC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jun 2023 09:31:02 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-5659d85876dso59843747b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Jun 2023 02:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686043861; x=1688635861;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=df7YhrQ8BP3E4zkFEMrRKwE0BeL6leEPeFTGUzFOtT0=;
 b=e4dX2Tw1bCyca1wEeQL4d2YW0EZZ7ZCZY2GRszbnnOaocctwaYJQfz8/0N2IvsZTLX
 B91liU5FEJBVHBSNoGNtY/+2kU5kOb6YfsOg1Gpy2fxKVSMafKJal0B4PFJsZx32zvUy
 X3X2r9QEkpuPQO8V2TOK2gg++aFATp6wdqM7aq7ggU5twM2QBAd9urGtg0Flw3B8rBIg
 dBrY3wMkkKzXPK9yeq7EUFjccf75NTaWE/1xfzinYF0/bTj6UV7JXYg61Vk2PqxjjxpT
 KymiopuYVgY8zjIjR9C7D1NvQPxtRznM9nOd1hJSFOvVW5PlbhF73G8YSczn5adXrN/3
 PSAA==
X-Gm-Message-State: AC+VfDx25+bL+ycO9k26YzrEMmyYBfls704+fVxLeVzFOpvX1eqdJbcy
 yiiAqYljKmhg1grE3bJtYvv4De94S/SuLA==
X-Google-Smtp-Source: ACHHUZ6Zt6bQSoMUqyVszCWPavsWHZVrLO+G4KlMDLm8vxPp75kY4PeLO+GlS6T+96mjxi1/YFAZlg==
X-Received: by 2002:a0d:ca44:0:b0:565:c1a7:d197 with SMTP id
 m65-20020a0dca44000000b00565c1a7d197mr1329583ywd.39.1686043860822; 
 Tue, 06 Jun 2023 02:31:00 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com.
 [209.85.128.179]) by smtp.gmail.com with ESMTPSA id
 j190-20020a0df9c7000000b00565caaf1821sm3868192ywf.63.2023.06.06.02.30.59
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 02:30:59 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-5659d85876dso59843167b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Jun 2023 02:30:59 -0700 (PDT)
X-Received: by 2002:a81:5c03:0:b0:561:baee:ee8 with SMTP id
 q3-20020a815c03000000b00561baee0ee8mr1474317ywb.32.1686043858984; Tue, 06 Jun
 2023 02:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <7b36ac43778b41831debd5c30b5b37d268512195.1686039915.git.geert+renesas@glider.be>
In-Reply-To: <7b36ac43778b41831debd5c30b5b37d268512195.1686039915.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Jun 2023 11:30:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXnMd=b1q+hmv1GsrugG7PhHXLznV5A0UKmoezaQY4oog@mail.gmail.com>
Message-ID: <CAMuHMdXnMd=b1q+hmv1GsrugG7PhHXLznV5A0UKmoezaQY4oog@mail.gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <simon.horman@corigine.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Fix build without PCS_LYNX
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

T24gVHVlLCBKdW4gNiwgMjAyMyBhdCAxMDoyN+KAr0FNIEdlZXJ0IFV5dHRlcmhvZXZlbgo8Z2Vl
cnQrcmVuZXNhc0BnbGlkZXIuYmU+IHdyb3RlOgo+IElmIFNUTU1BQ19FVEg9eSwgYnV0IFBDU19M
WU5YPW4gKGUuZy4gc2htb2JpbGVfZGVmY29uZmlnKToKPgo+ICAgICBhcm0tbGludXgtZ251ZWFi
aWhmLWxkOiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWRpby5v
OiBpbiBmdW5jdGlvbiBgc3RtbWFjX21kaW9fdW5yZWdpc3Rlcic6Cj4gICAgIHN0bW1hY19tZGlv
LmM6KC50ZXh0KzB4ZmJjKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgbHlueF9wY3NfZGVzdHJv
eScKPgo+IEFzIHBjc19seW54IGlzIHVzZWQgb25seSBvbiBkd21hY19zb2NmcGdhLCBmaXggdGhp
cyBieSBhZGRpbmcgYSBjaGVjawo+IGZvciBQQ1NfTFlOWCB0byB0aGUgY2xlYW51cCBwYXRoIGlu
IHRoZSBnZW5lcmljIGRyaXZlci4KPgo+IEZpeGVzOiA1ZDFmM2ZlN2QyZDU0ZDA0ICgibmV0OiBz
dG1tYWM6IGR3bWFjLXNvZ2ZwZ2E6IHVzZSB0aGUgbHlueCBwY3MgZHJpdmVyIikKPiBTaWduZWQt
b2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+IC0t
LQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWRpby5jIHwg
MiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNf
bWRpby5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21kaW8u
Ywo+IGluZGV4IGM3ODRhNjczMWYwOGUxMDguLjUzZWQ1OWQ3MzIyMTA4MTQgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21kaW8uYwo+ICsr
KyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tZGlvLmMKPiBA
QCAtNjY1LDcgKzY2NSw3IEBAIGludCBzdG1tYWNfbWRpb191bnJlZ2lzdGVyKHN0cnVjdCBuZXRf
ZGV2aWNlICpuZGV2KQo+ICAgICAgICAgaWYgKHByaXYtPmh3LT54cGNzKQo+ICAgICAgICAgICAg
ICAgICB4cGNzX2Rlc3Ryb3kocHJpdi0+aHctPnhwY3MpOwo+Cj4gLSAgICAgICBpZiAocHJpdi0+
aHctPmx5bnhfcGNzKQo+ICsgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX1BDU19MWU5YKSAm
JiBwcml2LT5ody0+bHlueF9wY3MpCj4gICAgICAgICAgICAgICAgIGx5bnhfcGNzX2Rlc3Ryb3ko
cHJpdi0+aHctPmx5bnhfcGNzKTsKPgo+ICAgICAgICAgbWRpb2J1c191bnJlZ2lzdGVyKHByaXYt
Pm1paSk7CgpBcyBwb2ludGVkIG91dCBieSBBcm5kLCB0aGlzIGRvZXNuJ3Qgd29yayB3aGVuIFBD
U19MWU5YIGlzIGEgbG9hZGFibGUKbW9kdWxlIGFuZCBTVE1NQUMgaXMgYnVpbHQtaW46Cmh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3IvMTFiZDM3ZTktYzYyZS00NmJhLTk0NTYtOGUzYjM1M2RmMjhm
QGFwcC5mYXN0bWFpbC5jb20KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAg
ICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
