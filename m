Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C54D4A57F3
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Feb 2022 08:42:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53E9BC60477;
	Tue,  1 Feb 2022 07:42:53 +0000 (UTC)
Received: from chris.i8u.org (mail.i8u.org [75.148.87.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C72F7C5C82A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jan 2022 18:55:16 +0000 (UTC)
Received: by chris.i8u.org (Postfix, from userid 1000)
 id B353F16C9535; Mon, 31 Jan 2022 10:55:14 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
 by chris.i8u.org (Postfix) with ESMTP id AE22316C92D6;
 Mon, 31 Jan 2022 10:55:14 -0800 (PST)
Date: Mon, 31 Jan 2022 10:55:14 -0800 (PST)
From: Hisashi T Fujinaka <htodd@twofifty.com>
To: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <30ed8220-e24d-4b40-c7a6-4b09c84f9a1f@gmail.com>
Message-ID: <09c97169-5f9a-fc8f-dea5-5423e7bfef34@twofifty.com>
References: <20220131172450.4905-1-saeed@kernel.org>
 <20220131095905.08722670@hermes.local>
 <CAMuHMdU17cBzivFm9q-VwF9EG5MX75Qct=is=F2h+Kc+VddZ4g@mail.gmail.com>
 <20220131183540.6ekn3z7tudy5ocdl@sx1>
 <30ed8220-e24d-4b40-c7a6-4b09c84f9a1f@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 01 Feb 2022 07:42:52 +0000
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Awogbemila <awogbemila@google.com>,
 Linus Walleij <linus.walleij@linaro.org>, rafal@milecki.pl,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Andy Gospodarek <andy@greyhouse.net>, Edwin Peer <edwin.peer@broadcom.com>,
 Wei Liu <wei.liu@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Jiri Pirko <jiri@resnulli.us>, l.stelmach@samsung.com,
 Shay Agroskin <shayagr@amazon.com>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Jon Mason <jdmason@kudzu.us>,
 Shannon Nelson <snelson@pensando.io>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Chris Snook <chris.snook@gmail.com>, Zhu Yanjun <zyjzyj2000@gmail.com>,
 Arthur Kiyanovski <akiyano@amazon.com>, Stefan Wahren <stefan.wahren@i2se.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 linux-stm32@st-md-mailman.stormreply.com, Gabriel Somlo <gsomlo@gmail.com>,
 Rain River <rain.1986.08.12@gmail.com>,
 Martin Habets <habetsm.xilinx@gmail.com>,
 Yisen Zhuang <yisen.zhuang@huawei.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Shai Malin <smalin@marvell.com>, Maxime Ripard <mripard@kernel.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, drivers@pensando.io,
 Omkar Kulkarni <okulkarni@marvell.com>, linux-arm-kernel@lists.infradead.org,
 Vegard Nossum <vegard.nossum@oracle.com>, David Arinzon <darinzon@amazon.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Catherine Sullivan <csully@google.com>, linux-hyperv@vger.kernel.org,
 oss-drivers@corigine.com, Noam Dagan <ndagan@amazon.com>,
 Rob Herring <robh@kernel.org>, Steen Hegelund <steen.hegelund@microchip.com>,
 Dexuan Cui <decui@microsoft.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Joel Stanley <joel@jms.id.au>,
 Simon Horman <simon.horman@corigine.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
 Arnd Bergmann <arnd@arndb.de>, Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Saeed Mahameed <saeed@kernel.org>, Liming Sun <limings@nvidia.com>,
 Michael Chan <michael.chan@broadcom.com>, Salil Mehta <salil.mehta@huawei.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Oleksij Rempel <linux@rempel-privat.de>,
 Edward Cree <ecree.xilinx@gmail.com>, Saeed Bishara <saeedb@amazon.com>,
 Mark Einon <mark.einon@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Slark Xiao <slark_xiao@163.com>, Gary Guo <gary@garyguo.net>,
 Gerhard Engleder <gerhard@engleder-embedded.com>,
 Jeroen de Borst <jeroendb@google.com>, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
 Prabhakar Kushwaha <pkushwaha@marvell.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Richard Cochran <richardcochran@gmail.com>, Marcin Wojtas <mw@semihalf.com>,
 David Thompson <davthompson@nvidia.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Saeed Mahameed <saeedm@nvidia.com>
Subject: Re: [Linux-stm32] [Intel-wired-lan] [PATCH net-next] net: kbuild:
 Don't default net vendor configs to y
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Mon, 31 Jan 2022, Florian Fainelli wrote:

> On 1/31/2022 10:35 AM, Saeed Mahameed wrote:
>> On 31 Jan 19:30, Geert Uytterhoeven wrote:
>>> On Mon, Jan 31, 2022 at 6:59 PM Stephen Hemminger
>>> <stephen@networkplumber.org> wrote:
>>>> On Mon, 31 Jan 2022 09:24:50 -0800
>>>> Saeed Mahameed <saeed@kernel.org> wrote:
>>>> 
>>>> > From: Saeed Mahameed <saeedm@nvidia.com>
>>>> >
>>>> > NET_VENDOR_XYZ were defaulted to 'y' for no technical reason.
>>>> >
>>>> > Since all drivers belonging to a vendor are supposed to default to 'n',
>>>> > defaulting all vendors to 'n' shouldn't be an issue, and aligns well
>>>> > with the 'no new drivers' by default mentality.
>>>> >
>>>> > Signed-off-by: Saeed Mahameed <saeedm@nvidia.com>
>>>> 
>>>> This was done back when vendors were introduced in the network drivers 
>>>> tree.
>>>> The default of Y allowed older configurations to just work.
>>> 
>>> And changing the defaults means all defconfigs must be updated first,
>>> else the user's configs will end up without drivers needed.
>>> 
>> 
>> As I understand correctly, at least for most common net drivers, having 
>> NET_VENDOR_XYZ=y doesn't actually build anything, we have flags per
>> module for each vendor and those are defaulted to N.
>
> Right, but once you start hiding NET_VENDOR_DRIVER_XYZ under a NET_VENDOR_XYZ 
> Kconfig symbol dependency, if NET_VENDOR_XYZ is not set to Y, then you have 
> no way to select NET_VENDOR_DRIVER_XYZ and so your old defconfig breaks.
>
>> 
>>>> So there was a reason, not sure if it matters anymore.
>>>> But it seems like useless repainting to change it now.
>>> 
>>> It might make sense to tune some of the defaults (i.e. change to
>>> "default y if ARCH_*") for drivers with clear platform dependencies.
>>> 
>> 
>> either set hard default to 'n' or just keep it as is, anything else is just
>> more confusion.
>
> Maybe the rule should go like this: any new driver vendor defaults to n, and 
> existing ones remain set to y, until we deprecate doing that and switching 
> them all off to n by 5.18?

Forgive my ignorance, but isn't it a regression if things quit working
even if it's just a configuration change?

From a user perspective I like having everything turned on initially so
it just works. Pruning things down is a lot easier than trying to figure
out what all to turn on. Especially in graphics.

-- 
Hisashi T Fujinaka - htodd@twofifty.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
