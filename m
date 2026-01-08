Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F04FD02B72
	for <lists+linux-stm32@lfdr.de>; Thu, 08 Jan 2026 13:45:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36F45C8F284;
	Thu,  8 Jan 2026 12:45:35 +0000 (UTC)
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch
 [79.135.106.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63C6BC8F282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jan 2026 12:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
 s=protonmail2; t=1767876332; x=1768135532;
 bh=aLc1ABNGDOubKMqJjdyEE2rUDJu3+cw3hXTWYt1I64k=;
 h=From:Date:Subject:Message-Id:To:Cc:From:To:Cc:Date:Subject:
 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=lyOmVC6eOUwGhcHBO5Eb3462sjFxqRvWZvq2Tnb1kiC0M83ZmLC0cGE15QPCn0EMK
 kF1laGjM9ulpW5X22nlxzMJ85BP/dhI7K6CWlDtnKld6FfPTWSR6zdv03ndr4j9NU0
 Ss/4Guj/HI1LBft19+e9PmHrG+KRRO93IF1DGv3PUieuC+syUKAKulF+7GR/KaNubo
 rSujErEg5+imTtlN4P9JxaF+q7AsQKKt35FTBBrIMYq2GRHE5SgO12fWaPNKBy+jWn
 pWPn+Ojc2VX2jb9s/f57BlvSiBYPBr5QSGNKGcWchPAUuBNNwDVezVFpSCX5lzuqNc
 asTVPIsgl8NHw==
X-Pm-Submission-Id: 4dn4Pk0Vvcz1DLbC
From: Sean Nyekjaer <sean@geanix.com>
Date: Thu, 08 Jan 2026 13:45:23 +0100
MIME-Version: 1.0
Message-Id: <20260108-stm32-pwm-v2-1-ced582974f8b@geanix.com>
X-B4-Tracking: v=1; b=H4sIAOKmX2kC/03MSwrCMBSF4a2UOzaSRw2NI/chHcR4095B05KUW
 CnZu7EgOPwPh2+HhJEwwbXZIWKmRHOoIU8NuNGGARk9a4PkUnPBLyytk5JseU3MCPfoWqU77lu
 o/yWip+2w7n3tkdI6x/dBZ/Fdf4r+U7JggimFBjtrvFPqNqANtJ3dPEFfSvkAjw/CIKMAAAA=
X-Change-ID: 20260105-stm32-pwm-91cb843680f4
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Sean Nyekjaer <sean@geanix.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] pwm: stm32: Always program polarity
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

Q29tbWl0IDczNDZlN2EwNThhMiAoInB3bTogc3RtMzI6IEFsd2F5cyBkbyBsYXp5IGRpc2FibGlu
ZyIpIHRyaWdnZXJlZCBhCnJlZ3Jlc3Npb24gd2hlcmUgUFdNIHBvbGFyaXR5IGNoYW5nZXMgY291
bGQgYmUgaWdub3JlZC4KCnN0bTMyX3B3bV9zZXRfcG9sYXJpdHkoKSB3YXMgc2tpcHBlZCBkdWUg
dG8gYSBtaXNtYXRjaCBiZXR3ZWVuIHRoZQpjYWNoZWQgcHdtLT5zdGF0ZS5wb2xhcml0eSBhbmQg
dGhlIGFjdHVhbCBoYXJkd2FyZSBzdGF0ZSwgbGVhdmluZyB0aGUKaGFyZHdhcmUgcG9sYXJpdHkg
dW5jaGFuZ2VkLgoKRml4ZXM6IDdlZGY3MzY5MjA1YiAoInB3bTogQWRkIGRyaXZlciBmb3IgU1RN
MzIgcGxhZnRvcm0iKQpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAjIDw9IDYuMTIKU2lnbmVk
LW9mZi1ieTogU2VhbiBOeWVramFlciA8c2VhbkBnZWFuaXguY29tPgpDby1kZXZlbG9wZWQtYnk6
IFV3ZSBLbGVpbmUtS8O2bmlnIDx1a2xlaW5la0BrZXJuZWwub3JnPgotLS0KVGhpcyBwYXRjaCBp
cyBvbmx5IGFwcGxpY2FibGUgZm9yIHN0YWJsZSB0cmVlJ3MgPD0gNi4xMgotLS0KQ2hhbmdlcyBp
biB2MjoKLSBUYWtlbiBwYXRjaCBpbXByb3ZlbWVudHMgZm9yIFV3ZQotIExpbmsgdG8gdjE6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjAxMDYtc3RtMzItcHdtLXYxLTEtMzNlOWU4YTlm
YzMzQGdlYW5peC5jb20KLS0tCiBkcml2ZXJzL3B3bS9wd20tc3RtMzIuYyB8IDMgKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9wd20vcHdtLXN0bTMyLmMgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYwppbmRleCBl
YjI0MDU0Zjk3Mjk3MzRkYTIxZWI5NmYyZTM3YWYwMzMzOWUzNDQwLi44NmU2ZWI3Mzk2ZjY3OTkw
MjQ5NTA5ZGQzNDdjYjVhNjBjOWNjZjE2IDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9wd20tc3Rt
MzIuYworKysgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYwpAQCAtNDU4LDggKzQ1OCw3IEBAIHN0
YXRpYyBpbnQgc3RtMzJfcHdtX2FwcGx5KHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3
bV9kZXZpY2UgKnB3bSwKIAkJcmV0dXJuIDA7CiAJfQogCi0JaWYgKHN0YXRlLT5wb2xhcml0eSAh
PSBwd20tPnN0YXRlLnBvbGFyaXR5KQotCQlzdG0zMl9wd21fc2V0X3BvbGFyaXR5KHByaXYsIHB3
bS0+aHdwd20sIHN0YXRlLT5wb2xhcml0eSk7CisJc3RtMzJfcHdtX3NldF9wb2xhcml0eShwcml2
LCBwd20tPmh3cHdtLCBzdGF0ZS0+cG9sYXJpdHkpOwogCiAJcmV0ID0gc3RtMzJfcHdtX2NvbmZp
Zyhwcml2LCBwd20tPmh3cHdtLAogCQkJICAgICAgIHN0YXRlLT5kdXR5X2N5Y2xlLCBzdGF0ZS0+
cGVyaW9kKTsKCi0tLQpiYXNlLWNvbW1pdDogZWIxODUwNGNhNWNmMWU2YTc2YTc1MmI3M2RhZjBl
ZjUxZGUzNTUxYgpjaGFuZ2UtaWQ6IDIwMjYwMTA1LXN0bTMyLXB3bS05MWNiODQzNjgwZjQKCkJl
c3QgcmVnYXJkcywKLS0gClNlYW4gTnlla2phZXIgPHNlYW5AZ2Vhbml4LmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
