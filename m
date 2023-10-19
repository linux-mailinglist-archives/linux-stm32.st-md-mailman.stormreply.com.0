Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD75F7D0301
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Oct 2023 22:07:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F0B6C6C844;
	Thu, 19 Oct 2023 20:07:53 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10CE0C6C83E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Oct 2023 20:07:52 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtZJ6-0000Af-V6; Thu, 19 Oct 2023 22:07:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtZJ5-002rfp-9F; Thu, 19 Oct 2023 22:07:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtZJ4-001ve0-W0; Thu, 19 Oct 2023 22:07:47 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Date: Thu, 19 Oct 2023 22:06:59 +0200
Message-ID: <20231019200658.1754190-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=962;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=SfkOOu4xgfaM/hozY/FdeBH1secC/s7CyzGx/50FQpc=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlMYxioDQkrC8dFLuY+p314hq7oHwBjo2vCmYsU
 hq+LOuoHwCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZTGMYgAKCRCPgPtYfRL+
 TnEVCACrZ8wLtZBRX2W64BhKcFJbJ1JMRPVmUvkOB6ZU0RKLsXYyHsbm2fbrwohmIZe3En93F2C
 RTvFMa3MOPQLddOjaUG7WaF+iYBXyN5opMn2Xb9uYTxRpzpbQVeH9qzVuShb/1j7ZoAg3kpwNlA
 fqUMGj3ZkNSNR2HRaYBPhTMTp8CknsK3Ig2il8hZY/wmK/qFxjcM7ZCupUo4hO1d+WOOVfn3x4y
 7GSvLyfNhMjbAwEe9+R+YXnn5NFIccznZWHTlvd8Hc10CVfO+v0uHtrTZbfTFDjIWFlh9hhf3ix
 AIrfkUJDGvYCQpOT5DXp0lSaWjK4kYBnB0PPYJIiJ1vhHxrz
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, kernel@pengutronix.de,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/5] pwm: stm32: Cleanups,
	get_state() and proper hw take over
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello,

some time ago Philipp already sent an implementation of .get_state() for
the stm32 PWM driver. He created this series from the feedback but
didn't come around to send it out. The goal of this series is to allow
to take over a pwm-backlight from the bootloader without flickering on
an stm32mp157 based machine.

The only thing I did here to Philipp's series was to split one of the
patches in two. Philipp had the contents of patches 4 and 5 in a single
patch.

Best regards
Uwe

Philipp Zabel (5):
  pwm: stm32: Replace write_ccrx with regmap_write
  pwm: stm32: Make ch parameter unsigned
  pwm: stm32: Use hweight32 in stm32_pwm_detect_channels
  pwm: stm32: Implement .get_state()
  pwm: stm32: Fix enable count for clk in .probe()

 drivers/pwm/pwm-stm32.c | 98 +++++++++++++++++++++++++----------------
 1 file changed, 61 insertions(+), 37 deletions(-)

base-commit: 4bb36d126cb3147d6bbfd00242a5b846dacad595
-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
