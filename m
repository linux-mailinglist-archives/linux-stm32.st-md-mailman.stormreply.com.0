Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA12F1C7A
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Nov 2019 18:28:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C05EC36B0B;
	Wed,  6 Nov 2019 17:28:55 +0000 (UTC)
Received: from mailgate1.rohmeurope.com (mailgate1.rohmeurope.com
 [178.15.145.194])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20551C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 17:28:53 +0000 (UTC)
X-AuditID: c0a8fbf4-183ff70000001fa6-4b-5dc302d46b4a
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com
 [192.168.251.178])
 by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id
 47.2E.08102.4D203CD5; Wed,  6 Nov 2019 18:28:52 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Wed, 6 Nov 2019 18:28:51 +0100
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "vilhelm.gray@gmail.com" <vilhelm.gray@gmail.com>
Thread-Topic: [PATCH v2 0/2] Add definition for GPIO direction
Thread-Index: AQHVlLAQU8xb+K9L/ECQSPwnZdt/+qd+VSuA
Date: Wed, 6 Nov 2019 17:28:51 +0000
Message-ID: <c333eb18eec9adf333e1b3cca2ff7ccacb2a863b.camel@fi.rohmeurope.com>
References: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
 <20191106143938.GA3176@icarus>
In-Reply-To: <20191106143938.GA3176@icarus>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [176.93.194.151]
Content-ID: <18FFF0DF279DD94B9327FC374E716AF8@de.rohmeurope.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TbUxTZxTee+/t7eWj41KBvsIkoWFZHJng5pbzwxGzX3dZwkYWk2UB2VWu
 lACFtGVTfyg41AGWlQEDOygfATcKOGg1SHEBiwq6YGV8TCcd6ajDmggOMKjI2L3tFH69zznP
 85zn/DgvQyqLmWgmW2sQdFo+V00HU4M/rdremiCG0pOqPbHQ4/0VwcSYkwDHOAPG47UElD+q
 JaHLeJWC5YYbFEycsCEYMA6R8Gz+ihw8kx9DezUFd4r7CVh1rZFQYm6hwFrTR8E9+ywB1c9/
 JMA2OyWDrztukmBvfI6g7Fk7CeOOehp+aP2WArfbiuCCb56AsimvDEqXzTTc7/pdBiOtjxF4
 2uspqG8bocCy1iWDed9nsLQwIIPLcw8pGKtzkXDvjJ2GtV4bBafaJ0RFhxfB/fMqmLbbZVDX
 2Y/gqcNCwd3KKgTGhTYafvlzCe1J4iZPOeRc99Jxmlu4fULOmWdGaa5utYXiHIPRXJ/ZLefG
 /rlGcjZrKc1NT12iOcv1VM7eeoxz1TUjzvToodh+0oY42/g0+iTm85Dd+3nDl59mZ2kTk78I
 0ZT3jtEFf4UeKplboovQxdAyFMRgdhdutjSRZSiYUbKTCBc7a+SBYhjhkxduiQXD0OxuXHZH
 Lhki2HdxsWPRryHZ5ki8WnSXlIgt7Pt4tMdLBETJeKSjlgrgt/HNkWEkYYqNx52VPX6Ngk3B
 XaYK/1AlexC7ykdpCQexCdj6h9GvR+w2XFo079eTrArb/l6RBbZmceslFxnAkdg3++//fTVe
 GjET0s4kux3/7EgMWPfgym4rHcBxuLrcIw+sEI6vn/FSJhRl3pRg3nCbN7nNm9zmTe4mJLMi
 nMdn52bxBmHnDp1QuEOXr8kTnwP5eTYUOOnli2jd+aETEQxyoq0MoY5UvON0pitf3Z+feVjD
 6zUZusJcQe9EmCHVEYq0isvpSkUmf/iIoMt/QcUwlFqleMNTma5kpawcQSgQdC/Y1xhGjRUm
 NJSuDNcJWcKhg9m5hg2aYIKk4cHREXpBmyno+EKDJkO6jwy9eCASFSrm9kp2hb6AzxO7AesN
 lMCYfA0tJHOloa2FVFLafK0QrVI0vyJKWUmqKdS+DHqAVAxSb1HMSYNCxX/9cs4DMYIQI5Ju
 O6UIA79BRRehXVGde3OGkxNqwob7Pccaf/sqKi5+Zb16MCfYQ7i8KTOhW9Nc79ERqStPmvZ+
 15dm8iV3xgxs1906fTW2KvXs6W7ftQP7Yh8fPdkYnniuNzguLP6IsjbsaYVsVav66Py6MkWt
 f30xPMwSX3L0+6Lcs9vWhtwhdsWM8RtT06JbVtX+gZrSa/idb5I6Pf8fqswH+ZQEAAA=
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "david.daney@cavium.com" <david.daney@cavium.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "ptyser@xes-inc.com" <ptyser@xes-inc.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "marek.behun@nic.cz" <marek.behun@nic.cz>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "khilman@kernel.org" <khilman@kernel.org>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "bamv2005@gmail.com" <bamv2005@gmail.com>, "joel@jms.id.au" <joel@jms.id.au>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
 "rjui@broadcom.com" <rjui@broadcom.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "ssantosh@kernel.org" <ssantosh@kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "sbranden@broadcom.com" <sbranden@broadcom.com>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "andrew@aj.id.au" <andrew@aj.id.au>, "info@metux.net" <info@metux.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "t.scherer@eckelmann.de" <t.scherer@eckelmann.de>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 0/2] Add definition for GPIO direction
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


On Wed, 2019-11-06 at 09:39 -0500, William Breathitt Gray wrote:
> On Wed, Nov 06, 2019 at 10:51:06AM +0200, Matti Vaittinen wrote:
> > The patch series adds definitions for GPIO line directions.

...snip...

> > This patch series is based on GPIO tree devel branch.
> 
> Just a tip for future patchsets in case you didn't know, you case
> specify the base of your patchset by using the "--base" option:
> https://git-scm.com/docs/git-format-patch#_base_tree_information
> 
> This will append a "base-commit" line with the commit hash at the end
> of
> the first message so that it's unabiguous which base you're using
> (useful in case the branch changes before your patch is reviewed).

Tanks William! I didn't know about the --base. It's nice to learn
something new every day :]

> > -- 
> > Matti Vaittinen, Linux device drivers
> > ROHM Semiconductors, Finland SWDC
> > Kiviharjunlenkki 1E
> > 90220 OULU
> > FINLAND
> > 
> > ~~~ "I don't think so," said Rene Descartes. Just then he vanished
> > ~~~
> > Simon says - in Latin please.
> > ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> > Thanks to Simon Glass for the translation =] 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
