Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF674603E69
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Oct 2022 11:14:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FE43C64104;
	Wed, 19 Oct 2022 09:14:20 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CFD6C63326
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Oct 2022 09:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666170859; x=1697706859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VQJoRuNRdeIpnDk2ac87eJh17oqgdcNVue8yLDhtyxs=;
 b=mkwfbKBvB7oLWxS9zfdlwu1xn/sxnN5S8GnUNvTy5Sjxlq2XUyZfRizm
 rM60Gzz5fmmtRSjLUInXf0959MpNZaWcg1xVkhInkcQ5gexQlPnBDf1XK
 FcTIw7Hx+y8MXrX4ExIlzN6eOc8iwU9tkYSWElHKqVPnc0OT7KCV/JK4g
 mIuaVQVphkIxU5KCJToo/XD42hdP3CXlxJFLYYUibtk81J9hkwE5aIKxH
 hZqaV75XhD4AFrN4UcXVsBC/XuCpkZNAPtrtXJjI/jKTwlmLpjCZMXu/0
 B/s7tk4bP1mAoHpvyH/+ycfuIYhSVUIHJWLcbRJ9HR7BJeWwN5aueCKax w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="303972256"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; d="scan'208";a="303972256"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 02:14:16 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="734119215"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; d="scan'208";a="734119215"
Received: from sponnura-mobl1.amr.corp.intel.com (HELO
 ijarvine-MOBL2.ger.corp.intel.com) ([10.251.214.35])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 02:14:13 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-serial@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 19 Oct 2022 12:11:41 +0300
Message-Id: <20221019091151.6692-35-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221019091151.6692-1-ilpo.jarvinen@linux.intel.com>
References: <20221019091151.6692-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [Linux-stm32] [PATCH 34/44] serial: stm32: Use uart_xmit_advance()
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

VGFrZSBhZHZhbnRhZ2Ugb2YgdGhlIG5ldyB1YXJ0X3htaXRfYWR2YW5jZSgpIGhlbHBlci4KClNp
Z25lZC1vZmYtYnk6IElscG8gSsOkcnZpbmVuIDxpbHBvLmphcnZpbmVuQGxpbnV4LmludGVsLmNv
bT4KLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNhcnQuYyB8IDcgKysrLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNhcnQuYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9z
dG0zMi11c2FydC5jCmluZGV4IGRmZGJjZjA5MmZhYy4uMjRkZWY3MmIyNTY1IDEwMDY0NAotLS0g
YS9kcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNhcnQuYworKysgYi9kcml2ZXJzL3R0eS9zZXJp
YWwvc3RtMzItdXNhcnQuYwpAQCAtNTk2LDggKzU5Niw3IEBAIHN0YXRpYyB2b2lkIHN0bTMyX3Vz
YXJ0X3RyYW5zbWl0X2NoYXJzX3BpbyhzdHJ1Y3QgdWFydF9wb3J0ICpwb3J0KQogCQlpZiAoIShy
ZWFkbF9yZWxheGVkKHBvcnQtPm1lbWJhc2UgKyBvZnMtPmlzcikgJiBVU0FSVF9TUl9UWEUpKQog
CQkJYnJlYWs7CiAJCXdyaXRlbF9yZWxheGVkKHhtaXQtPmJ1Zlt4bWl0LT50YWlsXSwgcG9ydC0+
bWVtYmFzZSArIG9mcy0+dGRyKTsKLQkJeG1pdC0+dGFpbCA9ICh4bWl0LT50YWlsICsgMSkgJiAo
VUFSVF9YTUlUX1NJWkUgLSAxKTsKLQkJcG9ydC0+aWNvdW50LnR4Kys7CisJCXVhcnRfeG1pdF9h
ZHZhbmNlKHBvcnQsIDEpOwogCX0KIAogCS8qIHJlbHkgb24gVFhFIGlycSAobWFzayBvciB1bm1h
c2spIGZvciBzZW5kaW5nIHJlbWFpbmluZyBkYXRhICovCkBAIC02NzMsOCArNjcyLDggQEAgc3Rh
dGljIHZvaWQgc3RtMzJfdXNhcnRfdHJhbnNtaXRfY2hhcnNfZG1hKHN0cnVjdCB1YXJ0X3BvcnQg
KnBvcnQpCiAKIAlzdG0zMl91c2FydF9zZXRfYml0cyhwb3J0LCBvZnMtPmNyMywgVVNBUlRfQ1Iz
X0RNQVQpOwogCi0JeG1pdC0+dGFpbCA9ICh4bWl0LT50YWlsICsgY291bnQpICYgKFVBUlRfWE1J
VF9TSVpFIC0gMSk7Ci0JcG9ydC0+aWNvdW50LnR4ICs9IGNvdW50OworCXVhcnRfeG1pdF9hZHZh
bmNlKHBvcnQsIGNvdW50KTsKKwogCXJldHVybjsKIAogZmFsbGJhY2tfZXJyOgotLSAKMi4zMC4y
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
