Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0464F52CE11
	for <lists+linux-stm32@lfdr.de>; Thu, 19 May 2022 10:18:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0FCDC03FE2;
	Thu, 19 May 2022 08:18:53 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5596C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 May 2022 08:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652948332; x=1684484332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B/wsivre0Bc6qlbjo3she/qQCDt/pTlKU20VjyLCa68=;
 b=ds2lK3GpWn0JeNMnSXvMHtOAFtg6Ko089y9zdTfSavX40iDz14ZmtEBM
 jtsQwDyJ0WhF2Gx9TPsMnNYWz/mcKRYNQ/dkL10+JgXl7bh7vOLVDKba6
 2f4QsbXcZXkHStB38D0jK5eRfnaNNVDl/l+QiMmYXs0+5PxGR+yDZkMG/
 YrtcMiG1WwJ5mPuCuIl9GmdT/rXp2xv1ow2X6iagmur+6fbZ2/JLt4eM/
 MRjhOxDCnurlv35+L7vIOBVg3PahGDVVTgVKBHFgGJUZ/t3wSfQ/oFXGS
 VH+W0yQn84z96/GkrO8NpE846v9hW310Pw0GfZC/AnVY+9LpbJ8Ufvv2n w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="297388990"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="297388990"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 01:18:50 -0700
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="598431518"
Received: from ivanovbx-mobl1.ger.corp.intel.com (HELO
 ijarvine-MOBL2.ger.corp.intel.com) ([10.249.33.234])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 01:18:47 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-serial@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Erwan Le Ray <erwan.leray@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 19 May 2022 11:18:07 +0300
Message-Id: <20220519081808.3776-9-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519081808.3776-1-ilpo.jarvinen@linux.intel.com>
References: <20220519081808.3776-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [Linux-stm32] [PATCH v2 8/9] serial: stm32-usart: Correct CSIZE,
	bits, and parity
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

QWRkIENTSVpFIHNhbml0aXphdGlvbiBmb3IgdW5zdXBwb3J0ZWQgQ1NJWkUgY29uZmlndXJhdGlv
bnMuIEluCmFkZGl0aW9uLCBpZiBwYXJpdHkgaXMgYXNrZWQgZm9yIGJ1dCBDU3ggd2FzIHVuc3Vw
cG9ydGVkLCB0aGUgc2Vuc2libGUKcmVzdWx0IGlzIENTOCtwYXJpdHkgd2hpY2ggcmVxdWlyZXMg
c2V0dGluZyBVU0FSVF9DUjFfTTAgbGlrZSB3aXRoIDkKYml0cy4KCkluY29ycmVjdCBDU0laRSBy
ZXN1bHRzIGluIG1pc2NhbGN1bGF0aW9uIG9mIHRoZSBmcmFtZSBiaXRzIGluCnR0eV9nZXRfY2hh
cl9zaXplKCkgb3IgaW4gaXRzIHByZWRlY2Vzc29yIHdoZXJlIHRoZSByb3VnaGx5IHRoZSBzYW1l
CmNvZGUgaXMgZGlyZWN0bHkgd2l0aGluIHVhcnRfdXBkYXRlX3RpbWVvdXQoKS4KCkNjOiBFcndh
biBMZSBSYXkgPGVyd2FuLmxlcmF5QHN0LmNvbT4KRml4ZXM6IGM4YTlkMDQzOTQ3YiAoc2VyaWFs
OiBzdG0zMjogZml4IHdvcmQgbGVuZ3RoIGNvbmZpZ3VyYXRpb24pClNpZ25lZC1vZmYtYnk6IEls
cG8gSsOkcnZpbmVuIDxpbHBvLmphcnZpbmVuQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJz
L3R0eS9zZXJpYWwvc3RtMzItdXNhcnQuYyB8IDE1ICsrKysrKysrKysrKy0tLQogMSBmaWxlIGNo
YW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0LmMgYi9kcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzIt
dXNhcnQuYwppbmRleCA4N2I1Y2Q0Yzk3NDMuLjNjNTUxZmQ0ZjNmZiAxMDA2NDQKLS0tIGEvZHJp
dmVycy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0LmMKKysrIGIvZHJpdmVycy90dHkvc2VyaWFsL3N0
bTMyLXVzYXJ0LmMKQEAgLTEwMzcsMTMgKzEwMzcsMjIgQEAgc3RhdGljIHZvaWQgc3RtMzJfdXNh
cnRfc2V0X3Rlcm1pb3Moc3RydWN0IHVhcnRfcG9ydCAqcG9ydCwKIAkgKiBDUzggb3IgKENTNyAr
IHBhcml0eSksIDggYml0cyB3b3JkIGFrYSBbTTE6TTBdID0gMGIwMAogCSAqIE0wIGFuZCBNMSBh
bHJlYWR5IGNsZWFyZWQgYnkgY3IxIGluaXRpYWxpemF0aW9uLgogCSAqLwotCWlmIChiaXRzID09
IDkpCisJaWYgKGJpdHMgPT0gOSkgewogCQljcjEgfD0gVVNBUlRfQ1IxX00wOwotCWVsc2UgaWYg
KChiaXRzID09IDcpICYmIGNmZy0+aGFzXzdiaXRzX2RhdGEpCisJfSBlbHNlIGlmICgoYml0cyA9
PSA3KSAmJiBjZmctPmhhc183Yml0c19kYXRhKSB7CiAJCWNyMSB8PSBVU0FSVF9DUjFfTTE7Ci0J
ZWxzZSBpZiAoYml0cyAhPSA4KQorCX0gZWxzZSBpZiAoYml0cyAhPSA4KSB7CiAJCWRldl9kYmco
cG9ydC0+ZGV2LCAiVW5zdXBwb3J0ZWQgZGF0YSBiaXRzIGNvbmZpZzogJXUgYml0c1xuIgogCQkJ
LCBiaXRzKTsKKwkJY2ZsYWcgJj0gfkNTSVpFOworCQljZmxhZyB8PSBDUzg7CisJCXRlcm1pb3Mt
PmNfY2ZsYWcgPSBjZmxhZzsKKwkJYml0cyA9IDg7CisJCWlmIChjZmxhZyAmIFBBUkVOQikgewor
CQkJYml0cysrOworCQkJY3IxIHw9IFVTQVJUX0NSMV9NMDsKKwkJfQorCX0KIAogCWlmIChvZnMt
PnJ0b3IgIT0gVU5ERUZfUkVHICYmIChzdG0zMl9wb3J0LT5yeF9jaCB8fAogCQkJCSAgICAgICAo
c3RtMzJfcG9ydC0+Zmlmb2VuICYmCi0tIAoyLjMwLjIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
