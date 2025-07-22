Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E013CB14884
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 08:49:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 984FCC3F932;
	Tue, 29 Jul 2025 06:49:42 +0000 (UTC)
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net
 [13.75.44.102])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BDD4C3F93F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jul 2025 11:25:36 +0000 (UTC)
Received: from E0004057DT (unknown [10.11.96.26])
 by app1 (Coremail) with SMTP id TAJkCgD3GxL8dH9oJr61AA--.44915S2;
 Tue, 22 Jul 2025 19:24:46 +0800 (CST)
From: =?gb2312?B?wO7Wvg==?= <lizhi2@eswincomputing.com>
To: "'Andrew Lunn'" <andrew@lunn.ch>
References: <20250703091808.1092-1-weishangjuan@eswincomputing.com>
 <20250703092015.1200-1-weishangjuan@eswincomputing.com>
 <c212c50e-52ae-4330-8e67-792e83ab29e4@lunn.ch>
 <7ccc507d.34b1.1980d6a26c0.Coremail.lizhi2@eswincomputing.com>
 <e734f2fd-b96f-4981-9f00-a94f3fd03213@lunn.ch>
 <6c5f12cd.37b0.1982ada38e5.Coremail.lizhi2@eswincomputing.com>
 <6b3c8130-77f0-4266-b1ed-2de80e0113b0@lunn.ch>
In-Reply-To: <6b3c8130-77f0-4266-b1ed-2de80e0113b0@lunn.ch>
Date: Tue, 22 Jul 2025 19:24:44 +0800
Message-ID: <006c01dbfafb$3a99e0e0$afcda2a0$@eswincomputing.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIWEBQeOCNcc3c3gjOhxIq/03sunAItNhDMAcjfDh0CUDC4/wE99IgTAia8sUkCW0gSXwGv9voh
Content-Language: zh-cn
X-CM-TRANSID: TAJkCgD3GxL8dH9oJr61AA--.44915S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtrWxuF1rJrW7ur4rGw45KFg_yoW7tw15pr
 W3XF4UWrWDKr1xtwnFkw48uF1rZa95GF13CF1DJr95Jws0vF9avr12kFWYgFy8Wr4v9F1j
 9rWUWan5ua1qkFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
 0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
 zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
 4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
 CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
 nIWIevJa73UjIFyTuYvjTRM6wCDUUUU
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/
X-Mailman-Approved-At: Tue, 29 Jul 2025 06:48:52 +0000
Cc: vladimir.oltean@nxp.com, edumazet@google.com, jszhang@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 weishangjuan@eswincomputing.com, ningyu@eswincomputing.com, 0x1207@gmail.com,
 kuba@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 jan.petrous@oss.nxp.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 dfustini@tenstorrent.com, linux-arm-kernel@lists.infradead.org,
 pinkesh.vaghela@einfochips.com, linmin@eswincomputing.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com, inochiama@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v3 2/2] ethernet: eswin: Add eic7700
	ethernet driver
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
Content-Type: multipart/mixed; boundary="===============7685081786078051102=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============7685081786078051102==
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable
Content-Language: zh-cn

Dear Andrew Lunn,
Thank you for your professional and valuable suggestions.
Our questions are embedded below your comments in the
original email below.


Best regards,

Li Zhi
Eswin Computing


> -----=D4=AD=CA=BC=D3=CA=BC=FE-----
> =B7=A2=BC=FE=C8=CB: "Andrew Lunn" <andrew@lunn.ch>
> =B7=A2=CB=CD=CA=B1=BC=E4:2025-07-21 21:10:55 (=D0=C7=C6=DA=D2=BB)
> =CA=D5=BC=FE=C8=CB: =C0=EE=D6=BE <lizhi2@eswincomputing.com>
> =B3=AD=CB=CD: weishangjuan@eswincomputing.com, andrew+netdev@lunn.ch,
davem@davemloft.net, edumazet@google.com, kuba@kernel.org, =
robh@kernel.org,
krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
vladimir.oltean@nxp.com, jszhang@kernel.org, jan.petrous@oss.nxp.com,
prabhakar.mahadev-lad.rj@bp.renesas.com, inochiama@gmail.com,
boon.khai.ng@altera.com, dfustini@tenstorrent.com, 0x1207@gmail.com,
linux-stm32@st-md-mailman.stormreply.com,
linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com,
linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com
> =D6=F7=CC=E2: Re: Re: Re: [PATCH v3 2/2] ethernet: eswin: Add eic7700 =
ethernet
driver
>=20
> > > > Let me clarify the purpose of the three elements in each =
dly_param_*
array:
> > > >   dly_param_[x][0]: Delay configuration for TXD signals
> > > >   dly_param_[x][1]: Delay configuration for control signals =
(e.g.,
TX_EN, RX_DV, RX_CLK)
> > > >   dly_param_[x][2]: Delay configuration for RXD signals
> > >=20
> > > Maybe add a #define or an enum for the index.
> > >=20
> > > Do these delays represent the RGMII 2ns delay?
> > >=20
> >=20
> > Yes, these delays refer to the RGMII delay, but they are not =
strictly
2ns. There are a few points that require further clarification:
> > 1. Regarding delay configuration logic:
> >    As you mentioned in version V2, rx-internal-delay-ps and
tx-internal-delay-ps will be mapped to and overwrite the corresponding =
bits
in the EIC7700_DELAY_VALUE1 register, which controls the rx_clk and =
tx_clk
delays. Is this understanding and approach correct and feasible?
>=20
> Please configure your email client to wrap at about 78
> characters. Standard network etiquette.
>=20
> Yes, if rx-internal-delay-ps or/and tx-internal-delay-ps are in DT,
> they should configure the delay the MAC applies.
>=20
>=20
> > 2. About the phy-mode setting:
> >    In our platform, the internal delays are provided by the MAC. =
When
configuring rx-internal-delay-ps and tx-internal-delay-ps in the device
tree, is it appropriate to set phy-mode =3D "rgmii-id" in this case?
>=20
> Please read:
>=20
>
https://elixir.bootlin.com/linux/v6.15.7/source/Documentation/devicetree/=
bin
dings/net/ethernet-controller.yaml#L287
>=20
> It gives a detailed description of what phy-mode =3D "rmgii-id" means. =

>=20
> > 3. Delay values being greater than 2ns:
> >    In our platform, the optimal delay values for rx_clk and tx_clk =
are
determined based on the board-level timing adjustment, and both are =
greater
than 2ns. Given this, is it reasonable and compliant with the RGMII
specification to set both rx-internal-delay-ps and tx-internal-delay-ps =
to
values greater than 2ns in the Device Tree?
>=20
> It is O.K. when the total delay is > 2ns. However, please note what is
> said, the normal way to implement delays in Linux. The PHY does the
> 2ns delay. The MAC can then do fine tuning, adding additional small
> delays.
>=20
> > There is a question that needs clarification:
> > The EIC7700_DELAY_VALUE0 and EIC7700_DELAY_VALUE1 registers contain =
the
optimal delay configurations determined through board-level phase
adjustment. Therefore, they are also used as the default values in our
platform. If the default delay is set to 0ps, the Ethernet interface may
fail to function correctly in our platform.
>=20
> So there is only every going to be one board? There will never produce
> a cost optimised version with a different, cheaper PHY? You will never
> support connecting the MAC directly an Ethernet switch? You will never
> make use of a PHY which can translate to SGMII/1000BaseX, and then
> have an SFP cage?
>=20
> DT properties are there to make your hardware more flexible. You can
> use it to describe such setups, and handle the timing needed for each.
>=20
> By default, when phy-mode is rgmii-id, the MAC adds 0ns, the PHY 2ns,
> and most systems will just work. That 2ns is what the RGMII standard
> requires. You can then fine tune it with rx-internal-delay-ps and
> tx-internal-delay-ps if your design does not correctly follow the
> RGMII standard.
>=20

Yes, DT properties are there to make our hardware more flexible.

Our platform uses three dedicated registers to configure RGMII signal
delays, due to differences in board-level designs. These registers =
control
delays for signals including RXD0=A8C3, TXD0=A8C3, RXDV, RXCLK, and =
TXCLK.
Among these, RXCLK and TXCLK are directly related to the standard DT
properties `rx-internal-delay-ps` and `tx-internal-delay-ps`, =
respectively.
The remaining signals (such as RXD0-4, TXD0-4, RXDV, etc.) require
additional configuration that cannot be expressed using standard
properties.

In v2, `eswin,dly-param-xxx` is used to configure all delay registers =
via
device tree, including RXCLK and TXCLK. Based on the latest discussion,
this approach in the next version:
- The delay configuration for RXCLK and TXCLK will be handled using the
 standard DT properties `rx-internal-delay-ps` and =
`tx-internal-delay-ps`.
- The remaining delay configuration (e.g., for RXD0-4, TXD0-4, RXDV) =
will
 continue to use the vendor-specific `eswin,dly-param-xxx` properties.
- If the standard delay properties are not specified in DT, a default of =
0
ps
 will be assumed.

Is this understanding and approach correct and feasible?

> 	Andrew


--===============7685081786078051102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7685081786078051102==--
