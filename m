Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 596FE53E401
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Jun 2022 12:05:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D4A2C57183;
	Mon,  6 Jun 2022 10:05:59 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 076D4C0D2BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jun 2022 10:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654509957; x=1686045957;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZM/pEhOqDZJ2vEjEvweRMXHfCanuCKshhfEXaADs/+c=;
 b=jaNm1aU9efyutkQ9nN78ncqjJehZ57vRN/HhNhpKsMtXgAGFaL/udPPH
 2wXZMXM/ajMtvYujNYKwBmqdHmRMf0BuYlDbPyiSjMUvk9K/41SXnPVQ4
 7nCr5KL+y6lRimBmcG+MXf2hIsOrDOfHtPIt+oWa8cFKfsEgGNiXW5l6P
 MZp3eq0g9GG7LObWT75efG7W+MqzqXTULPEKdefNEWn76XopeyKAxklhc
 QtiPOvktzcEuVD6OfY8o7vSPLQ35w6yqw98M2UTTRtnKCb+wbEF9QB3Sd
 1nL3UMEpGp4tnppa/Q782Rjh1kytYS0N3Y7BObTiNebUg1PxxUck0/l5R g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="256480543"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="256480543"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 03:05:55 -0700
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="635523787"
Received: from amkossek-mobl1.ger.corp.intel.com (HELO
 ijarvine-MOBL2.ger.corp.intel.com) ([10.252.57.11])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 03:05:52 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-serial@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon,  6 Jun 2022 13:04:18 +0300
Message-Id: <20220606100433.13793-22-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220606100433.13793-1-ilpo.jarvinen@linux.intel.com>
References: <20220606100433.13793-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [Linux-stm32] [PATCH 21/36] serial: stm32: Fill in rs485_supported
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

QWRkIGluZm9ybWF0aW9uIG9uIHN1cHBvcnRlZCBzZXJpYWxfcnM0ODUgZmVhdHVyZXMuCgpTaWdu
ZWQtb2ZmLWJ5OiBJbHBvIErDpHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+
Ci0tLQogZHJpdmVycy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0LmMgfCA4ICsrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2Vy
aWFsL3N0bTMyLXVzYXJ0LmMgYi9kcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNhcnQuYwppbmRl
eCBiN2I0NGY0MDUwZDQuLmRiM2RkOTczMWVlMSAxMDA2NDQKLS0tIGEvZHJpdmVycy90dHkvc2Vy
aWFsL3N0bTMyLXVzYXJ0LmMKKysrIGIvZHJpdmVycy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0LmMK
QEAgLTEzNzUsNiArMTM3NSwxMyBAQCBzdGF0aWMgdm9pZCBzdG0zMl91c2FydF9kZWluaXRfcG9y
dChzdHJ1Y3Qgc3RtMzJfcG9ydCAqc3RtMzJwb3J0KQogCWNsa19kaXNhYmxlX3VucHJlcGFyZShz
dG0zMnBvcnQtPmNsayk7CiB9CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc2VyaWFsX3JzNDg1IHN0
bTMyX3JzNDg1X3N1cHBvcnRlZCA9IHsKKwkuZmxhZ3MgPSBTRVJfUlM0ODVfRU5BQkxFRCB8IFNF
Ul9SUzQ4NV9SVFNfT05fU0VORCB8IFNFUl9SUzQ4NV9SVFNfQUZURVJfU0VORCB8CisJCSBTRVJf
UlM0ODVfUlhfRFVSSU5HX1RYLAorCS5kZWxheV9ydHNfYmVmb3JlX3NlbmQgPSAxLAorCS5kZWxh
eV9ydHNfYWZ0ZXJfc2VuZCA9IDEsCit9OworCiBzdGF0aWMgaW50IHN0bTMyX3VzYXJ0X2luaXRf
cG9ydChzdHJ1Y3Qgc3RtMzJfcG9ydCAqc3RtMzJwb3J0LAogCQkJCSBzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogewpAQCAtMTM5NCw2ICsxNDAxLDcgQEAgc3RhdGljIGludCBzdG0zMl91
c2FydF9pbml0X3BvcnQoc3RydWN0IHN0bTMyX3BvcnQgKnN0bTMycG9ydCwKIAlwb3J0LT5oYXNf
c3lzcnEgPSBJU19FTkFCTEVEKENPTkZJR19TRVJJQUxfU1RNMzJfQ09OU09MRSk7CiAJcG9ydC0+
aXJxID0gaXJxOwogCXBvcnQtPnJzNDg1X2NvbmZpZyA9IHN0bTMyX3VzYXJ0X2NvbmZpZ19yczQ4
NTsKKwlwb3J0LT5yczQ4NV9zdXBwb3J0ZWQgPSAmc3RtMzJfcnM0ODVfc3VwcG9ydGVkOwogCiAJ
cmV0ID0gc3RtMzJfdXNhcnRfaW5pdF9yczQ4NShwb3J0LCBwZGV2KTsKIAlpZiAocmV0KQotLSAK
Mi4zMC4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
