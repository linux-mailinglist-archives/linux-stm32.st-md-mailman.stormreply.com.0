Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2EF8B1D7C
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Apr 2024 11:09:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D868C7128B;
	Thu, 25 Apr 2024 09:09:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF80FC69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 09:09:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40A0E2F;
 Thu, 25 Apr 2024 02:09:51 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com
 [10.1.197.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 67F7B3F64C;
 Thu, 25 Apr 2024 02:09:21 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>
Date: Thu, 25 Apr 2024 10:09:14 +0100
Message-Id: <171403612523.3476473.4709282225111312825.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713858615.git.u.kleine-koenig@pengutronix.de>
References: <cover.1713858615.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 James Clark <james.clark@arm.com>, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 0/5] coresight: Convert to platform remove
	callback returning void
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

T24gVHVlLCAyMyBBcHIgMjAyNCAxMDowNjo1NyArMDIwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
dGU6Cj4gdGhpcyBzZXJpZXMgY29udmVydHMgYSBmZXcgcGxhdGZvcm0gZHJpdmVycyBiZWxvdyBk
cml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQKPiB0aGF0IHJlY2VudGx5IHN0YXJ0ZWQgdG8gaW1w
bGVtZW50IGEgLnJlbW92ZSgpIGNhbGxiYWNrIHRvIGltcGxlbWVudAo+IC5yZW1vdmVfbmV3KCkg
aW5zdGVhZC4gU2VlIGNvbW1pdCA1YzVhNzY4MGU2N2IgKCJwbGF0Zm9ybTogUHJvdmlkZSBhIHJl
bW92ZQo+IGNhbGxiYWNrIHRoYXQgcmV0dXJucyBubyB2YWx1ZSIpIGZvciBhbiBleHRlbmRlZCBl
eHBsYW5hdGlvbiBhbmQgdGhlIGV2ZW50dWFsCj4gZ29hbC4KPiAKPiBBbGwgY29udmVyc2F0aW9u
cyBhcmUgdHJpdmlhbCwgYmVjYXVzZSB0aGUgZHJpdmVyJ3MgLnJlbW92ZSgpIGNhbGxiYWNrcwo+
IHJldHVybmVkIHplcm8gdW5jb25kaXRpb25hbGx5IGFscmVhZHkuCj4gCj4gWy4uLl0KCkFwcGxp
ZWQsIHRoYW5rcyEKClsxLzVdIGNvcmVzaWdodDogY2F0dTogQ29udmVydCB0byBwbGF0Zm9ybSBy
ZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9jb3Jlc2lnaHQvYy9jMDFjYjQxOTEwNGM0MTg3ZjJhMTQ4ZjcyYTdkY2M2N2U3NzgwMWE1Clsy
LzVdIGNvcmVzaWdodDogZGVidWc6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNr
IHJldHVybmluZyB2b2lkCiAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY29yZXNpZ2h0L2Mv
OTcxYzJiMTA3YjU3NDJlZjFkZmEzYTQwNWNkNWVlNzAzMzUwMmQ2MApbMy81XSBjb3Jlc2lnaHQ6
IHN0bTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQK
ICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9jb3Jlc2lnaHQvYy85ODFkNWY5MmNhMmUzM2Qx
YjBiYTNlMzU2M2RlNTJkYzk2NjFmYjkyCls0LzVdIGNvcmVzaWdodDogdG1jOiBDb252ZXJ0IHRv
IHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogICAgICBodHRwczovL2dp
dC5rZXJuZWwub3JnL2NvcmVzaWdodC9jLzM4YTM4ZGE0NDc1NzlmNjgzMTE0ZWRiMWM4MjU0NDkx
YjQxNzY4NTMKWzUvNV0gY29yZXNpZ2h0OiB0cGl1OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92
ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2Nv
cmVzaWdodC9jL2JhOGMwNmZlN2UxNmRkZmQ0NGVjZTdmYWJkOWFmMmRjMmU2ZDQ5ZTcKCkJlc3Qg
cmVnYXJkcywKLS0gClN1enVraSBLIFBvdWxvc2UgPHN1enVraS5wb3Vsb3NlQGFybS5jb20+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
