Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7CB4DB245
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Mar 2022 15:14:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F20BBC5F1F2;
	Wed, 16 Mar 2022 14:14:19 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACAD9C01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Mar 2022 14:14:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 39B01B81B3E;
 Wed, 16 Mar 2022 14:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9BCC340E9;
 Wed, 16 Mar 2022 14:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647440056;
 bh=cmOGP0m+pkZjBJC0zI+CTqKgqlFbBneVJbZRza4TXBI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N5hfQwxf33hqWYzZPW4VtGu+gPVX3PUCtwmVOuKvJ3tPXWh7ENeR3pvBJYRPE+PT/
 vgnr9uw+qzudOkUrgEWZ+yhMCE/RXvorqT+g2IibbVh2fKFulZhXlaS3aufP55fEp4
 ynZ9yr1A6WCPLivwEps5G3JGLRouq6Bx+7m3v71mDf6x0Pd/+zVWfI5v6LVljUGJ9/
 PempAwz13AcjQDliUBuv9Vem3htUGyIlSxC6NJBLm2vHKinCQyKJWigh4aAINfn4It
 y93548VLhjobvodibEMhTjimiBPCLWYIce2Tm4b36/6gY5Pmdhaavo4urZ6LB5j6Mv
 af99vvaJ+MOjw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 16 Mar 2022 10:13:44 -0400
Message-Id: <20220316141354.247750-3-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220316141354.247750-1-sashal@kernel.org>
References: <20220316141354.247750-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, linux-input@vger.kernel.org,
 Jiri Kosina <jkosina@suse.cz>, jikos@kernel.org, alexandre.torgue@foss.st.com,
 benjamin.tissoires@redhat.com, mcoquelin.stm32@gmail.com,
 =?UTF-8?q?Michael=20H=C3=BCbner?= <michaelh.95@t-online.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.16 03/13] HID: Add support for open
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
M2I5MzVmZjAyZDUuLmE0ZTIwZjllNTk4YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9oaWQvaGlkLXRo
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
