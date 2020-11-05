Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6882A75C6
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Nov 2020 03:54:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0064EC36B36;
	Thu,  5 Nov 2020 02:54:13 +0000 (UTC)
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BB74C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Nov 2020 02:54:10 +0000 (UTC)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4CRSlg554vz8p;
 Thu,  5 Nov 2020 03:54:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1604544850; bh=Iju+iBATdmDfQ4OsSyAkY4bpLERQ5SJXyrehln6ZXhQ=;
 h=Date:From:Subject:To:Cc:From;
 b=fCjP2YRyVLi9HR9jvBZEGU69UoTDXSiAgzwssbTSnUbw4r7VdErU1NjD9MR9zGbOQ
 0U44JjSICzkhByj3UHy1c3s52Rawdel+4+oHQDZ5TRiMwSxyCRCDa+/MPlGk9Go+m+
 n+jmvPL8C7tJsxDamyo0IL3CasVR5PxRxNnvrnM6PGpYES5obL1sl6QcNOuPfA33Bm
 dGdvLNheiRNpNpzw69E6WeDGWs0DiRJ0kxzo8lXYQttbFZw4reVS7zh1pt1WMeRTOi
 1DQsZJUnWsHokOFj6FHz1Nb6JBqhHM7j2ZObLm7yN6C43lqU3uds4mXVnUBDJ2VdUR
 6vYdt7KuJakBQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date: Thu, 05 Nov 2020 03:54:07 +0100
Message-Id: <7ede83e8d78414d8618e1044fd8fd11e8ed7a09f.1604544767.git.mirq-linux@rere.qmqm.pl>
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: lgirdwood@gmail.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 wens@csie.org, broonie@kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] regulator: debug early supply resolving
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

SGVscCBkZWJ1Z2dpbmcgdGhlIGNhc2Ugd2hlbiBzZXRfbWFjaGluZV9jb25zdHJhaW50cygpIG5l
ZWRzIHRvIGJlCnJlcGVhdGVkLgoKU2lnbmVkLW9mZi1ieTogTWljaGHFgiBNaXJvc8WCYXcgPG1p
cnEtbGludXhAcmVyZS5xbXFtLnBsPgotLS0KIGRyaXZlcnMvcmVndWxhdG9yL2NvcmUuYyB8IDIg
KysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3JlZ3VsYXRvci9jb3JlLmMgYi9kcml2ZXJzL3JlZ3VsYXRvci9jb3JlLmMKaW5kZXggNDAyYTcy
YTcwZWIxLi5jODRlM2IwYjYzZGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcmVndWxhdG9yL2NvcmUu
YworKysgYi9kcml2ZXJzL3JlZ3VsYXRvci9jb3JlLmMKQEAgLTUyNzEsNiArNTI3MSw4IEBAIHJl
Z3VsYXRvcl9yZWdpc3Rlcihjb25zdCBzdHJ1Y3QgcmVndWxhdG9yX2Rlc2MgKnJlZ3VsYXRvcl9k
ZXNjLAogCQkvKiBGSVhNRTogdGhpcyBjdXJyZW50bHkgdHJpZ2dlcnMgYSBjaGlja2VuLWFuZC1l
Z2cgcHJvYmxlbQogCQkgKiB3aGVuIGNyZWF0aW5nIC1TVVBQTFkgc3ltbGluayBpbiBzeXNmcyB0
byBhIHJlZ3VsYXRvcgogCQkgKiB0aGF0IGlzIGp1c3QgYmVpbmcgY3JlYXRlZCAqLworCQlyZGV2
X2RiZyhyZGV2LCAid2lsbCByZXNvbHZlIHN1cHBseSBlYXJseTogJXNcbiIsCisJCQkgcmRldi0+
c3VwcGx5X25hbWUpOwogCQlyZXQgPSByZWd1bGF0b3JfcmVzb2x2ZV9zdXBwbHkocmRldik7CiAJ
CWlmICghcmV0KQogCQkJcmV0ID0gc2V0X21hY2hpbmVfY29uc3RyYWludHMocmRldik7Ci0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
