Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8D0ABB645
	for <lists+linux-stm32@lfdr.de>; Mon, 19 May 2025 09:36:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20DF7C78F9B;
	Mon, 19 May 2025 07:36:02 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E31AC78F8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 May 2025 07:36:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B89B85C4831;
 Mon, 19 May 2025 07:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246D8C4CEE4;
 Mon, 19 May 2025 07:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747640159;
 bh=zVO3+aXmayvngbyw4PYPDuKbl+yyblwK0y0qXrmeAvE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nSBfSPEKXsp/UlGw7oh6zxljPJhursDcFHV+SVB7eJixi2czxaPjMaAWCj8fR+g4o
 wrHAs+OAquHVincN9MFKT5NIJksr8FZfvlJ/VYIJT3gOnzscxwi+qNgCx6esb2DVSK
 yqt8NBb0L6+ISLqLcM414LnjsMRJFT3BwMa6RqEVtlDCun7+h8ndXvGhkb8//8QhXm
 flNeM0oUQcX2TWnyv55TRJ9lv7n5mMb9JTN5COoBbcz1K7WbS/mqw0R8B/2JNq4BpX
 KKzemZfAQPADmqX2YG9QT1gE781xOJIWt6p96zlvlcEKhgFnneo89LaJomzVsZoFtU
 EvU8U3PVSEpPw==
Date: Mon, 19 May 2025 08:35:53 +0100
From: Lee Jones <lee@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20250519073553.GH2936510@google.com>
References: <20250429125133.1574167-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250429125133.1574167-1-fabrice.gasnier@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 daniel.lezcano@linaro.org, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, ukleinek@kernel.org,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, will@kernel.org,
 tglx@linutronix.de, jic23@kernel.org, wbg@kernel.org
Subject: [Linux-stm32] [GIT PULL] Immutable branch between MFD,
 Clocksource and PWM due for the v6.16 merge window
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

RW5qb3khCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDBhZjJmNmJlMWI0Mjgx
Mzg1YjYxOGNiODZhZDk0NmVkZWQwODlhYzg6CgogIExpbnV4IDYuMTUtcmMxICgyMDI1LTA0LTA2
IDEzOjExOjMzIC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6
CgogIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9sZWUvbWZk
LmdpdCBpYi1tZmQtY2xvY2tzb3VyY2UtcHdtLXY2LjE2Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5n
ZXMgdXAgdG8gM2Y1MWIyMzJjMWRhOGU1OWViNTYyZjFkODE1MzMzMzQ4MjdhNDc5OToKCiAgcHdt
OiBzdG0zMi1scDogQWRkIHN1cHBvcnQgZm9yIHN0bTMybXAyNSAoMjAyNS0wNS0xMyAxMToxMzo1
NiArMDEwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KSW1tdXRhYmxlIGJyYW5jaCBiZXR3ZWVuIE1GRCwgQ2xvY2tzb3Vy
Y2UgYW5kIFBXTSBkdWUgZm9yIHRoZSB2Ni4xNiBtZXJnZSB3aW5kb3cKCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KRmFicmlj
ZSBHYXNuaWVyICg0KToKICAgICAgZHQtYmluZGluZ3M6IG1mZDogc3RtMzItbHB0aW1lcjogQWRk
IHN1cHBvcnQgZm9yIHN0bTMybXAyNQogICAgICBtZmQ6IHN0bTMyLWxwdGltZXI6IEFkZCBzdXBw
b3J0IGZvciBzdG0zMm1wMjUKICAgICAgY2xvY2tzb3VyY2UvZHJpdmVycy9zdG0zMi1scHRpbWVy
OiBBZGQgc3VwcG9ydCBmb3Igc3RtMzJtcDI1CiAgICAgIHB3bTogc3RtMzItbHA6IEFkZCBzdXBw
b3J0IGZvciBzdG0zMm1wMjUKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3Qsc3RtMzIt
bHB0aW1lci55YW1sICB8ICA0MCArKystCiBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXN0bTMy
LWxwLmMgICAgICAgICAgICAgICB8ICA2MSArKysrKy0KIGRyaXZlcnMvbWZkL3N0bTMyLWxwdGlt
ZXIuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMzICsrKy0KIGRyaXZlcnMvcHdtL3B3bS1z
dG0zMi1scC5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgMjE5ICsrKysrKysrKysrKysrKysr
Ky0tLQogaW5jbHVkZS9saW51eC9tZmQvc3RtMzItbHB0aW1lci5oICAgICAgICAgICAgICAgICAg
fCAgMzcgKysrLQogNSBmaWxlcyBjaGFuZ2VkLCAzNTAgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRp
b25zKC0pCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
