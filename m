Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D6D15D65D
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Feb 2020 12:14:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 878A0C36B0B;
	Fri, 14 Feb 2020 11:14:35 +0000 (UTC)
Received: from mailgate1.rohmeurope.com (mailgate1.rohmeurope.com
 [178.15.145.194])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C3DDC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2020 11:14:31 +0000 (UTC)
X-AuditID: c0a8fbf4-279ff70000001e6c-6b-5e46811668cc
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com
 [192.168.251.178])
 by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id
 E8.DD.07788.611864E5; Fri, 14 Feb 2020 12:14:30 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Fri, 14 Feb 2020 12:14:18 +0100
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Thread-Topic: [PATCH 2/2] pinctrl: Use new GPIO_LINE_DIRECTION
Thread-Index: AQHVmWQOgs5cHlsmlU+Vdtkf5ZbC06eIlAaAgAAGWoCAAC7LgICSQxwA
Date: Fri, 14 Feb 2020 11:14:18 +0000
Message-ID: <81f96837457028ad9eeb690776526701d5b1bc8c.camel@fi.rohmeurope.com>
References: <20191112141819.GA22076@localhost.localdomain>
 <201911131438.KT6pnFZ7%lkp@intel.com>
 <ac16492e11899ef4ec981f7f2e84714c7d61d2a7.camel@fi.rohmeurope.com>
 <CACRpkdYAmye8wT39fqy=LN+6pXDvrcQ0SyDTCvG7aSgea3Uumw@mail.gmail.com>
In-Reply-To: <CACRpkdYAmye8wT39fqy=LN+6pXDvrcQ0SyDTCvG7aSgea3Uumw@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-ID: <B125B6ABB10ADA4B93001582484ED809@de.rohmeurope.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02TbVBUVRzG59x3wK3LirvH9WXGJTNyhLS3Y2MmTsNcPqQ11ZQ2Qte4shDs
 0t3FYWWKBVNml0xWmRrXRQmwmF23bDchDAZafFkjREGXzCiBJVhqlolphuFN2utN4dN97nme
 5/87H/6HwZU3aA2TozcJop7P01KxRHvDjHeDqjQt46nhay+ga0MzBCqPfEmjb0OdAHX3+3Hk
 OXKJQJ1tEQK1l/YCNB25SKPqk8cAcjaY0fzgXyQqre8lUFdFEKCq2a8w5B0Kksje1kUj3+lZ
 gHovOCnUe/AGQJ1TbhydD0cwNHF3Hkf2O+doZAuGSDR2cJBCo54+EpV9/DRyngkQ6NSch0T+
 T99BTb4vcOQM3ALoaF0PgYZP+CgUcYcAOv51OhqfSkVXAlYcTfm7sW3ruLLxyxQ3/sshmjt1
 tphz/NFFce6ecoo7N+gmOXvXBq7Z0U9zdd42ijttncS4upYwxnldVoqztHcT3G/BFoqrOHmP
 4Hz1Ja+qdsdt2cub9r+ek61P2fpunO7zpiqiYAIWNfzooS2gBtoAw0D2GVg5nW4DsYySvQVg
 6w+1lPwTALDs9mVcClHsFmi7TdtADJPAboYdASchaZw9Fg/HOp6Q9FL2RXjncA8lxRPYrdD3
 XZws02BgNlVKEOxaOH54lJS0gt0Bj3s/IWXSPwD2jQ4DyYhhX4ONTsv98YBdBa2WCCaj1ND7
 5+T9MmRZWN/Sjct6GQwP3fv/XAtbpwYIiYuzSfCbCylydRv02PpoWa+BVRUDtHyHeHj1RIio
 BCrHIoJjoe1Y1HYsajsWtWsA6QIwn8/Jy+ZNwsZkUShMFg26/OjnPUO+F8gr+u/3YN6f7gcY
 A/xgOYNplyly9WkZykf2GrLMOt6oyxQL8wSjH0AG1yYoOtZEPUUWbz4giIYH1gqG0KoV6wbs
 e5SsxHpfEAoE8YG7kmG0UBH+KFqMF4VsoWhfTp5pwcaYGGl4rCbBKOizBJEvNOkypeXINEa3
 Q7KWRLn2EolrLODzo6dy9SewnqkMV9fizMXqM7W4ktAb9IJGrVglRVkpqivUPwSNATUDtEsV
 v0vukug7fThnLIrAoogjSS9LCBO/YGkswK48NLFLNe2uefyVzPVUyvaiZnOr+9H03OXq7eII
 s69/9/Xnm38OWWcm9TtuXndcTYp8uHOzqzELuF6aeyN1V+Jnc40u/9ri4kuhTaXq54KJtl+5
 mStv3ky0v/3B/rMlq1ePHD3wbKWTX/lW7t97mu42qEY0JebG5BXnNzU/llFuLN85pCWMOn7j
 k7ho5P8DL+cyqWQEAAA=
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "heiko@sntech.de" <heiko@sntech.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "paul@crapouillou.net" <paul@crapouillou.net>,
 "eric@anholt.net" <eric@anholt.net>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "lkp@intel.com" <lkp@intel.com>,
 "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "wens@csie.org" <wens@csie.org>, "agross@kernel.org" <agross@kernel.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "rjui@broadcom.com" <rjui@broadcom.com>,
 "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 "sbranden@broadcom.com" <sbranden@broadcom.com>,
 "sean.wang@kernel.org" <sean.wang@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "wahrenst@gmx.net" <wahrenst@gmx.net>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>
Subject: Re: [Linux-stm32] [PATCH 2/2] pinctrl: Use new GPIO_LINE_DIRECTION
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

Hi-deeee-Ho Peeps!


On Wed, 2019-11-13 at 10:40 +0100, Linus Walleij wrote:
> On Wed, Nov 13, 2019 at 7:52 AM Vaittinen, Matti
> <Matti.Vaittinen@fi.rohmeurope.com> wrote:
> > On Wed, 2019-11-13 at 14:30 +0800, kbuild test robot wrote:
> > > Hi Matti,
> > > 
> > > Thank you for the patch! Perhaps something to improve:
> > > 
> > > [auto build test WARNING on
> > > 70d97e099bb426ecb3ad4bf31e88dbf2ef4b2e4c]
> > > 
> > >    480        static int wmt_gpio_get_direction(struct gpio_chip
> > > *chip, unsigned offset)
> > >    481        {
> > >    482                struct wmt_pinctrl_data *data =
> > > gpiochip_get_data(chip);
> > >    483                u32 bank = WMT_BANK_FROM_PIN(offset);
> > >    484                u32 bit = WMT_BIT_FROM_PIN(offset);
> > >    485                u32 reg_dir = data->banks[bank].reg_dir;
> > >    486                u32 val;
> > >    487
> > >    488                val = readl_relaxed(data->base + reg_dir);
> > >    489                if (val & BIT(bit))
> > >  > 490                        GPIO_LINE_DIRECTION_OUT;
> > 
> > Right. Return is missing. I think I already fixed this - I guess I
> > sent
> > wrong version... Sorry guys. I'll do v3 with only this return added
> > -
> > and I'll send it to limited amount of recipients as I think most of
> > you
> > guys may not be interested. Probably to Linus W, Geert and GPIO
> > list
> > only. Let me know if you want to see the v3 (or other subsequent
> > patches)

I just noticed this was never merged even though I was sure I sent a
fixed version. It took me a while but I guess I managed to dig out the
reason...

First I sent v2 with the return missing:
https://lore.kernel.org/linux-gpio/20191112141819.GA22076@localhost.localdomain/

And then I did indeed send a fixed version:
https://lore.kernel.org/linux-gpio/20191113071501.GA22158@localhost.localdomain/#Z30drivers:pinctrl:vt8500:pinctrl-wmt.c

...but titled this as v2 too. I guess that's why it never caught
correct attention.

I tried rebasing this to current gpio/devel. The pinctrl-ingenic.c had
gained trivial conflict - do you want me to get the pinctrl tree and do
merging on top of it && resending this or do you want to try applying
it?

Sorry for messing with the versions!

Br,
	Matti Vaittinen
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
