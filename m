Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A403355BAA4
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jun 2022 17:08:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 565AAC04003;
	Mon, 27 Jun 2022 15:08:08 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89461C03FC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jun 2022 15:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656342486; x=1687878486;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OkWPsn2b02Q9Pv+/0ZVMO3zsX02+G170/f67CGxFMUY=;
 b=CrJ7XythEdYnHlHVhpGqrbaQ7NOMYimWsAMsIrTEg4YcFwxRNdrEL6Cz
 5VD07PSZe5vnkNeGVKjBJOQDrdbHFj/Rg9DcB6gKUtGupSw9o0rYEGj0+
 3nFy5qM0k3LbGe7rhCBY2cOjmHp+8IM0lUK1k49brVKnHvDobEYQ4ZW49
 KKJPESfshUvshIdgz8VJxuCssSzM+Pll9mvZF+Le/Q2DzbwxVvR/cEsew
 gNiU3etpMhq4H6zC1uAjXCiSj2LSULGk3V1A4BbZa6bgHZ/RnVgSRFSi3
 pGsyWE7aVcDjN0N6GMzRrAPgFkIHZCzVLL173EfPgJOZTadmGmNcO5YRC Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="280228582"
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="280228582"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 08:08:04 -0700
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="646461411"
Received: from gretavix-mobl3.amr.corp.intel.com (HELO
 ijarvine-MOBL2.ger.corp.intel.com) ([10.249.43.78])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 08:08:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Yves Coppeaux <yves.coppeaux@st.com>, Bich HEMON <bich.hemon@st.com>,
 linux-serial@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 27 Jun 2022 18:07:52 +0300
Message-Id: <20220627150753.34510-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [Linux-stm32] [PATCH] serial: stm32: Clear prev values before
	setting RTS delays
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

VGhlIGNvZGUgbGFja3MgY2xlYXJpbmcgb2YgcHJldmlvdXMgREVBVC9ERURUIHZhbHVlcy4gVGh1
cywgY2hhbmdpbmcKdmFsdWVzIG9uIHRoZSBmbHkgcmVzdWx0cyBpbiBnYXJiYWdlIGRlbGF5cyB0
ZW5kaW5nIHRvd2FyZHMgdGhlIG1heGltdW0KdmFsdWUgYXMgbW9yZSBhbmQgbW9yZSBiaXRzIGFy
ZSBPUmVkIHRvZ2V0aGVyLiAoTGVhdmluZyBSUzQ4NSBtb2RlCndvdWxkIGhhdmUgY2xlYXJlZCB0
aGUgb2xkIHZhbHVlcyB0aG91Z2gpLgoKRml4ZXM6IDFiY2RhMDlkMjkxMCAoInNlcmlhbDogc3Rt
MzI6IGFkZCBzdXBwb3J0IGZvciBSUzQ4NSBoYXJkd2FyZSBjb250cm9sIG1vZGUiKQpTaWduZWQt
b2ZmLWJ5OiBJbHBvIErDpHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+Cgot
LS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jIHwgMiArKwogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9zdG0z
Mi11c2FydC5jIGIvZHJpdmVycy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0LmMKaW5kZXggZGIzZGQ5
NzMxZWUxLi4wY2ZlMTgzZjQwNzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9zdG0z
Mi11c2FydC5jCisrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jCkBAIC03Miw2
ICs3Miw4IEBAIHN0YXRpYyB2b2lkIHN0bTMyX3VzYXJ0X2NvbmZpZ19yZWdfcnM0ODUodTMyICpj
cjEsIHUzMiAqY3IzLCB1MzIgZGVsYXlfQURFLAogCSpjcjMgfD0gVVNBUlRfQ1IzX0RFTTsKIAlv
dmVyOCA9ICpjcjEgJiBVU0FSVF9DUjFfT1ZFUjg7CiAKKwkqY3IxICY9IH4oVVNBUlRfQ1IxX0RF
RFRfTUFTSyB8IFVTQVJUX0NSMV9ERUFUX01BU0spOworCiAJaWYgKG92ZXI4KQogCQlyczQ4NV9k
ZWF0X2RlZHQgPSBkZWxheV9BREUgKiBiYXVkICogODsKIAllbHNlCgotLSAKdGc6ICg2NTUzNDcz
NmQ5YTUuLikgZml4L3N0bTMyLWRlbGF5LXJ0cy1jbGVhcmluZyAoZGVwZW5kcyBvbjogdHR5LW5l
eHQpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
