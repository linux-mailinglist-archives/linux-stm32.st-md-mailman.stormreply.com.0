Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 986295B4902
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Sep 2022 23:16:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C849C64116;
	Sat, 10 Sep 2022 21:16:49 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3226C03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Sep 2022 21:16:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4B0D6B8094B;
 Sat, 10 Sep 2022 21:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F312C43470;
 Sat, 10 Sep 2022 21:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662844605;
 bh=AzSnHITp5t6kjGJzlorCsejjfhK4RLQGh1dl9cKmYFM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=src69G4Cq485jR5zs8tM1npeZUmi8CGsr9faL2nGpeN8esS+qnRQN1ATatjmwpHp3
 mDfRGkAfcuFXUWP/GZJ0ekQMvthYw+31/Tt+bvRbuyUSDb9ANtrIVaY1FFhwDjy2Ge
 WExIynGVWBJ8Bx+6A8xCIjW3jQCyjVqKAtqvGJscRYUk7NFOTzcVxohxGlx+tCgXXA
 raYHJHYF/TT/3CC/lq6/f26OtAuKJ7gCkGMsKCdsk4mjSn8poseStd5hABbbnGV7VH
 AdiA8mUDsuP5SmBC2yItvQE7BW7ASuDqu7rJNKgFEcw0IEwgB0H7X7CN7XE2AhEzi0
 IYSi8jEC7TPGw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat, 10 Sep 2022 17:15:57 -0400
Message-Id: <20220910211623.69825-12-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220910211623.69825-1-sashal@kernel.org>
References: <20220910211623.69825-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, linux-input@vger.kernel.org,
 Jiri Kosina <jkosina@suse.cz>, jikos@kernel.org, benjamin.tissoires@redhat.com,
 mcoquelin.stm32@gmail.com,
 =?UTF-8?q?Michael=20H=C3=BCbner?= <michaelh.95@t-online.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.19 12/38] HID: thrustmaster: Add
	sparco wheel and fix array length
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

RnJvbTogTWljaGFlbCBIw7xibmVyIDxtaWNoYWVsaC45NUB0LW9ubGluZS5kZT4KClsgVXBzdHJl
YW0gY29tbWl0IGQ5YTE3NjUxZjM3NDllNjk4OTBkYjU3Y2E2NmU2NzdkZmVlNzA4MjkgXQoKQWRk
IGRldmljZSBpZCBmb3IgdGhlIFNwYXJjbyBSMzgzIE1vZCB3aGVlbC4KCkZpeCB3aGVlbCBpbmZv
IGFycmF5IGxlbmd0aCB0byBtYXRjaCBhY3R1YWwgd2hlZWwgY291bnQgcHJlc2VudCBpbiB0aGUg
YXJyYXkuCgpTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEjDvGJuZXIgPG1pY2hhZWxoLjk1QHQtb25s
aW5lLmRlPgpTaWduZWQtb2ZmLWJ5OiBKaXJpIEtvc2luYSA8amtvc2luYUBzdXNlLmN6PgpTaWdu
ZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9o
aWQvaGlkLXRocnVzdG1hc3Rlci5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2hpZC9oaWQtdGhydXN0
bWFzdGVyLmMgYi9kcml2ZXJzL2hpZC9oaWQtdGhydXN0bWFzdGVyLmMKaW5kZXggYzNlNmQ2OWZk
ZmJkOS4uY2YxNjc5YjBkNGZiYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9oaWQvaGlkLXRocnVzdG1h
c3Rlci5jCisrKyBiL2RyaXZlcnMvaGlkL2hpZC10aHJ1c3RtYXN0ZXIuYwpAQCAtNjcsMTIgKzY3
LDEzIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdG1fd2hlZWxfaW5mbyB0bV93aGVlbHNfaW5mb3Nb
XSA9IHsKIAl7MHgwMjAwLCAweDAwMDUsICJUaHJ1c3RtYXN0ZXIgVDMwMFJTIChNaXNzaW5nIEF0
dGFjaG1lbnQpIn0sCiAJezB4MDIwNiwgMHgwMDA1LCAiVGhydXN0bWFzdGVyIFQzMDBSUyJ9LAog
CXsweDAyMDksIDB4MDAwNSwgIlRocnVzdG1hc3RlciBUMzAwUlMgKE9wZW4gV2hlZWwgQXR0YWNo
bWVudCkifSwKKwl7MHgwMjBhLCAweDAwMDUsICJUaHJ1c3RtYXN0ZXIgVDMwMFJTIChTcGFyY28g
UjM4MyBNb2QpIn0sCiAJezB4MDIwNCwgMHgwMDA1LCAiVGhydXN0bWFzdGVyIFQzMDAgRmVycmFy
aSBBbGNhbnRhcmEgRWRpdGlvbiJ9LAogCXsweDAwMDIsIDB4MDAwMiwgIlRocnVzdG1hc3RlciBU
NTAwUlMifQogCS8vezB4MDQwNywgMHgwMDAxLCAiVGhydXN0bWFzdGVyIFRNWCJ9CiB9OwogCi1z
dGF0aWMgY29uc3QgdWludDhfdCB0bV93aGVlbHNfaW5mb3NfbGVuZ3RoID0gNDsKK3N0YXRpYyBj
b25zdCB1aW50OF90IHRtX3doZWVsc19pbmZvc19sZW5ndGggPSA3OwogCiAvKgogICogVGhpcyBz
dHJ1Y3RzIGNvbnRhaW5zIChpbiBsaXR0bGUgZW5kaWFuKSB0aGUgcmVzcG9uc2UgZGF0YQotLSAK
Mi4zNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
