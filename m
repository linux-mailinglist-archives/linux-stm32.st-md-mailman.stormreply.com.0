Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4116FCB471
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2019 08:23:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C878C36B0B;
	Fri,  4 Oct 2019 06:23:46 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C618C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2019 06:23:44 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1iGH08-0002b5-Iz; Fri, 04 Oct 2019 08:23:40 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1iGH04-0005Rk-Dy; Fri, 04 Oct 2019 08:23:36 +0200
Date: Fri, 4 Oct 2019 08:23:36 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Yizhuo <yzhai003@ucr.edu>
Message-ID: <20191004062336.jidzrytx4z5talro@pengutronix.de>
References: <20191004044649.2405-1-yzhai003@ucr.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191004044649.2405-1-yzhai003@ucr.edu>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pwm: stm32: Fix the usage of
 uninitialized variable in stm32_pwm_config()
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello,

On Thu, Oct 03, 2019 at 09:46:49PM -0700, Yizhuo wrote:
> Inside function stm32_pwm_config(), variable "psc" and " arr"
> could be uninitialized if regmap_read() returns -EINVALs.
> However, they are used later in the if statement to decide
> the return value which is potentially unsafe.
> =

> The same case happens in function stm32_pwm_detect_channels()
> with variable "ccer", but we cannot just return -EINVAL because
> the error code is not acceptable by the caller. Aslo, the variable

s/Aslo/Also/

> "ccer" in functionstm32_pwm_detect_complementary() could also be

s/functionstm32_pwm_detect_/function stm32_pwm_detect_/

> uninitialized, since stm32_pwm_detect_complementary() returns void,
> the patch is not easy.

active_channels() is also affected. Also there are calls to
regmap_update_bits which should have their return values checked.

While a patch to fix these all is not trivial it is certainly possible
and I would prefer to fix the problem completely.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
