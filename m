Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 547F04DB25D
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Mar 2022 15:15:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D051C5F1F2;
	Wed, 16 Mar 2022 14:15:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03EA0C01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Mar 2022 14:15:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BBB7F61209;
 Wed, 16 Mar 2022 14:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28C4C340F1;
 Wed, 16 Mar 2022 14:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647440140;
 bh=06CzfFreRm9dpfVdjhehEwrUJE4C9J41VTJAo+SAPec=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XSS+Iyyhe4BvpkdNxR+Mb7C4MNyVIK+B5sQuaEuzYbeNsPJ1urQJxyXrDaVjSniZJ
 5p00fsZQJ7qi8E4Q/Bx91bum5VLyH4HhZ+xNvZxoVlobh0s+9EHkmheYH1XbbLT4Zs
 rzawl1c8yaP0/edyatVB3PyQhET1T0cmN8TlfZ82RGi3LCMNPCwmy08FPDB3+ZXO9I
 jVPC/x8SC4FirGaABxCmNrjRA4tlCKqOL2SyIknVVk0oEa/LiNvqVW5NN6bfrUOXlJ
 fL3EXRjQywGc/FyylQn7qu6/wwXrdkVEUxBF5ZwhV6OutB7tZrcvgiZw/0W6FOWicZ
 KfwS2E/k9TS+w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 16 Mar 2022 10:15:03 -0400
Message-Id: <20220316141513.247965-3-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220316141513.247965-1-sashal@kernel.org>
References: <20220316141513.247965-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, linux-input@vger.kernel.org,
 Jiri Kosina <jkosina@suse.cz>, jikos@kernel.org, alexandre.torgue@foss.st.com,
 benjamin.tissoires@redhat.com, mcoquelin.stm32@gmail.com,
 =?UTF-8?q?Michael=20H=C3=BCbner?= <michaelh.95@t-online.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.15 03/13] HID: Add support for open
	wheel and no attachment to T300
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
YW0gY29tbWl0IDBhNWE1ODc1MDFiNTRlOGM2ZDg2OTYwYjA0N2Q0NDkxZmQ0MGRjZjIgXQoKRGlm
ZmVyZW50IGFkZCBvbnMgdG8gdGhlIHdoZWVsIGJhc2UgcmVwb3J0IGRpZmZlcmVudCBtb2RlbHMu
IEhhdmluZwpubyB3aGVlbCBtb3VudGVkIHRvIHRoZSBiYXNlIGFuZCB1c2luZyB0aGUgb3BlbiB3
aGVlbCBhdHRhY2htZW50IGlzCmFkZGVkIGhlcmUuCgpTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEjD
vGJuZXIgPG1pY2hhZWxoLjk1QHQtb25saW5lLmRlPgpTaWduZWQtb2ZmLWJ5OiBKaXJpIEtvc2lu
YSA8amtvc2luYUBzdXNlLmN6PgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtl
cm5lbC5vcmc+Ci0tLQogZHJpdmVycy9oaWQvaGlkLXRocnVzdG1hc3Rlci5jIHwgMiArKwogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL2hp
ZC10aHJ1c3RtYXN0ZXIuYyBiL2RyaXZlcnMvaGlkL2hpZC10aHJ1c3RtYXN0ZXIuYwppbmRleCAw
YzkyYjdmOWI4YjguLjgwNTgxNmJlODIyNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9oaWQvaGlkLXRo
cnVzdG1hc3Rlci5jCisrKyBiL2RyaXZlcnMvaGlkL2hpZC10aHJ1c3RtYXN0ZXIuYwpAQCAtNjQs
NyArNjQsOSBAQCBzdHJ1Y3QgdG1fd2hlZWxfaW5mbyB7CiAgKi8KIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgdG1fd2hlZWxfaW5mbyB0bV93aGVlbHNfaW5mb3NbXSA9IHsKIAl7MHgwMzA2LCAweDAwMDYs
ICJUaHJ1c3RtYXN0ZXIgVDE1MFJTIn0sCisJezB4MDIwMCwgMHgwMDA1LCAiVGhydXN0bWFzdGVy
IFQzMDBSUyAoTWlzc2luZyBBdHRhY2htZW50KSJ9LAogCXsweDAyMDYsIDB4MDAwNSwgIlRocnVz
dG1hc3RlciBUMzAwUlMifSwKKwl7MHgwMjA5LCAweDAwMDUsICJUaHJ1c3RtYXN0ZXIgVDMwMFJT
IChPcGVuIFdoZWVsIEF0dGFjaG1lbnQpIn0sCiAJezB4MDIwNCwgMHgwMDA1LCAiVGhydXN0bWFz
dGVyIFQzMDAgRmVycmFyaSBBbGNhbnRhcmEgRWRpdGlvbiJ9LAogCXsweDAwMDIsIDB4MDAwMiwg
IlRocnVzdG1hc3RlciBUNTAwUlMifQogCS8vezB4MDQwNywgMHgwMDAxLCAiVGhydXN0bWFzdGVy
IFRNWCJ9Ci0tIAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
