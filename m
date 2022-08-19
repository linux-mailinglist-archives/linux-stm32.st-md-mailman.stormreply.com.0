Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA46D59B9D0
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Aug 2022 08:51:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62DF0C65046;
	Mon, 22 Aug 2022 06:51:24 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0B51C03FEA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Aug 2022 16:06:43 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-11c59785966so5699090fac.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Aug 2022 09:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semihalf.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=C/VkUkLDlA7UTo6eTiCDZwcwtLETboqa7t425d7cVFs=;
 b=QofUb7DJOdTcBKkHtRs4SbBflrFzOCIw2B9e+j2rPfVm3+DTUrJWEO4p4eDZy8jLZk
 opsdXQiUJ9WXgMaU1sxZmlc+wuYRoW1/xU68v5GngopvGwxsby5sDbM+TAAkskyyYVbJ
 v0/8DXCGDQYfB2r+7xmBiYCbNMDUeutJGNtIMunNcf4ImRmfm9wTwpQn2yZcEE6A3vN7
 qogadHylDWza51m4clAc74N/Ll8Gd4wv74ESdXlTG0n3xSP3k774PL52ShWjIF3wvopM
 uW6U6tKls0ZmmFGkjaspYpaTtF500g0bFsCrWBdvelWGz+7nuVgbOwF88CUVfE/Y3CHd
 rblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=C/VkUkLDlA7UTo6eTiCDZwcwtLETboqa7t425d7cVFs=;
 b=lED2W4mlp13gzAjnUFr+Uf5UE4aMqRNA7f6JMyZXwYDVlO+4qZipIO3qHVRL0EuXAc
 dhzeI+nSjaQl7E89v3INt0NLtxkD+bKDEI1zoVS9dBcWbLlHqZsc6iBfis8wGfaENHcC
 ro5FBGmJFO8KTG2utCg+VbLVnO2NIx4/bS/2beApzSisUrWuBa6EpT7ounp7pTSyqEr2
 ONgE45QAuNKuPavvjfLv4M95B/KO9opF8gkeEh2K00LrkSAR1PC7urHBWG6BTs3+oIHJ
 Xt1dgsA+amL0KhKIx4331MoelriMfQ6UbcE8ItxHQtrhSyXcs8KmD/5rN/mmevrMPmE9
 8Gcg==
X-Gm-Message-State: ACgBeo2uUxKUIpx7HvImpaqA5m0PMbH8qFPtv1meQFOJ6wv+T66DhfeQ
 jgDRuZcyndEkl9a80Fy/gVpSORegGB6Bg0764cVXow==
X-Google-Smtp-Source: AA6agR6Uut65noEds9DTEAIq4MQRn9wvqo20AqeK6lgjbB1e71ZoXHSsYUO7cMA7xG1TwfyTBeH7dfiOL39FELxWe+4=
X-Received: by 2002:a05:6870:a184:b0:116:bd39:7f94 with SMTP id
 a4-20020a056870a18400b00116bd397f94mr7002666oaf.5.1660925202008; Fri, 19 Aug
 2022 09:06:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220818210050.7108-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220818210050.7108-1-wsa+renesas@sang-engineering.com>
From: Marcin Wojtas <mw@semihalf.com>
Date: Fri, 19 Aug 2022 18:06:29 +0200
Message-ID: <CAPv3WKe2oxyjdyBrkDWwpSFKY21OtB4XEHz8YoWZ0LwhcLkNVw@mail.gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailman-Approved-At: Mon, 22 Aug 2022 06:51:23 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Igor Russkikh <irusskikh@marvell.com>,
 Kevin Brace <kevinbrace@bracecomputerlab.com>,
 David Dillow <dave@thedillows.org>, Somnath Kotur <somnath.kotur@broadcom.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andy Gospodarek <andy@greyhouse.net>,
 Wei Liu <wei.liu@kernel.org>, Manish Chopra <manishc@marvell.com>,
 Samuel Holland <samuel@sholland.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 Christian Lamparter <chunkeey@googlemail.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jose Abreu <joabreu@synopsys.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Franky Lin <franky.lin@broadcom.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Chris Lee <christopher.lee@cspi.com>, Nick Child <nnac123@linux.ibm.com>,
 Jiri Pirko <jiri@resnulli.us>, Jay Vosburgh <j.vosburgh@gmail.com>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 Arend van Spriel <aspriel@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Igor Mitsyanko <imitsyanko@quantenna.com>, Krzysztof Halasa <khalasa@piap.pl>,
 Shay Agroskin <shayagr@amazon.com>, linux-omap@vger.kernel.org,
 Petr Machata <petrm@nvidia.com>, libertas-dev@lists.infradead.org,
 Rasesh Mody <rmody@marvell.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Douglas Miller <dougmill@linux.ibm.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Ralf Baechle <ralf@linux-mips.org>,
 Vivien Didelot <vivien.didelot@gmail.com>, Ion Badulescu <ionut@badula.org>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Stanislav Yakovlev <stas.yakovlev@gmail.com>, Jon Mason <jdmason@kudzu.us>,
 Vladimir Oltean <olteanv@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Christian Benvenuti <benve@cisco.com>, Samuel Chessman <chessman@tux.org>,
 linux-usb@vger.kernel.org, Ronak Doshi <doshir@vmware.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Chris Snook <chris.snook@gmail.com>, Denis Kirjanov <kda@linux-powerpc.org>,
 Prashant Sreedharan <prashant@broadcom.com>, linux-kernel@vger.kernel.org,
 Daniele Venzano <venza@brownhat.org>, Eric Dumazet <edumazet@google.com>,
 Zhu Yanjun <zyjzyj2000@gmail.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 Arthur Kiyanovski <akiyano@amazon.com>, Leon Romanovsky <leon@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Rain River <rain.1986.08.12@gmail.com>, Veaceslav Falico <vfalico@gmail.com>,
 Martin Habets <habetsm.xilinx@gmail.com>,
 Yisen Zhuang <yisen.zhuang@huawei.com>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Steve Glendinning <steve.glendinning@shawell.net>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Ido Schimmel <idosch@nvidia.com>, Sean Wang <sean.wang@mediatek.com>,
 linuxppc-dev@lists.ozlabs.org, linux-can@vger.kernel.org,
 Siva Reddy Kallam <siva.kallam@broadcom.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Doug Berger <opendmb@gmail.com>,
 Simon Kelley <simon@thekelleys.org.uk>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Mirko Lindner <mlindner@marvell.com>,
 Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>,
 Nicolas Pitre <nico@fluxnic.net>, David Arinzon <darinzon@amazon.com>,
 Rohit Maheshwari <rohitm@chelsio.com>, Tariq Toukan <tariqt@nvidia.com>,
 Sudarsana Kalluru <skalluru@marvell.com>, Taras Chornyi <tchornyi@marvell.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-mediatek@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>,
 linux-wireless@vger.kernel.org, Ajit Khaparde <ajit.khaparde@broadcom.com>,
 Petko Manolov <petkan@nucleusys.com>, Andreas Larsson <andreas@gaisler.com>,
 Jason Wang <jasowang@redhat.com>, Kurt Kanzenbach <kurt@linutronix.de>,
 linux-hyperv@vger.kernel.org, oss-drivers@corigine.com, netdev@vger.kernel.org,
 Subbaraya Sundeep <sbhatta@marvell.com>,
 Hin-Tak Leung <htl10@users.sourceforge.net>,
 Jassi Brar <jaswinder.singh@linaro.org>, Noam Dagan <ndagan@amazon.com>,
 Stanislaw Gruszka <stf_xl@wp.pl>, Ajay Singh <ajay.kathat@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 linux-rdma@vger.kernel.org, Guo-Fu Tseng <cooldavid@cooldavid.org>,
 Dexuan Cui <decui@microsoft.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 b43-dev@lists.infradead.org, Simon Horman <simon.horman@corigine.com>,
 Paolo Abeni <pabeni@redhat.com>, Allen Hubbe <allenbh@gmail.com>,
 Shahed Shaikh <shshaikh@marvell.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Byungho An <bh74.an@samsung.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Francois Romieu <romieu@fr.zoreil.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Don Fry <pcnet32@frontier.com>,
 John Crispin <john@phrozen.org>, Michael Chan <michael.chan@broadcom.com>,
 virtualization@lists.linux-foundation.org,
 Ishizaki Kou <kou.ishizaki@toshiba.co.jp>,
 Salil Mehta <salil.mehta@huawei.com>, GR-Linux-NIC-Dev@marvell.com,
 linux-parisc@vger.kernel.org, Geoff Levand <geoff@infradead.org>,
 linux-sunxi@lists.linux.dev, Edward Cree <ecree.xilinx@gmail.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 Saeed Bishara <saeedb@amazon.com>, Mark Einon <mark.einon@gmail.com>,
 Geetha sowjanya <gakula@marvell.com>, Oliver Neukum <oneukum@suse.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 Govindarajulu Varadarajan <_govind@gmx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ayush Sawal <ayush.sawal@chelsio.com>, UNGLinuxDriver@microchip.com,
 linux-acenic@sunsite.dk, Herton Ronaldo Krzesinski <herton@canonical.com>,
 Rahul Verma <rahulv@marvell.com>, Russell King <linux@armlinux.org.uk>,
 SHA-cyfmac-dev-list@infineon.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
 Steffen Klassert <klassert@kernel.org>, Sunil Goutham <sgoutham@marvell.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Jes Sorensen <jes@trained-monkey.org>, nic_swsd@realtek.com,
 Ariel Elior <aelior@marvell.com>, Jouni Malinen <j@w1.fi>,
 Kalle Valo <kvalo@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, brcm80211-dev-list.pdl@broadcom.com,
 Sridhar Samudrala <sridhar.samudrala@intel.com>,
 David Ahern <dsahern@kernel.org>, linux-mips@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, Stephen Hemminger <stephen@networkplumber.org>,
 hariprasad <hkelam@marvell.com>, ntb@lists.linux.dev,
 Raju Rangoju <rajur@chelsio.com>, Larry Finger <Larry.Finger@lwfinger.net>,
 Saeed Mahameed <saeedm@nvidia.com>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [Linux-stm32] [PATCH] net: move from strlcpy with unused retval
	to strscpy
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

Y3p3LiwgMTggc2llIDIwMjIgbyAyMzowMSBXb2xmcmFtIFNhbmcKPHdzYStyZW5lc2FzQHNhbmct
ZW5naW5lZXJpbmcuY29tPiBuYXBpc2HFgihhKToKPgo+IEZvbGxvdyB0aGUgYWR2aWNlIG9mIHRo
ZSBiZWxvdyBsaW5rIGFuZCBwcmVmZXIgJ3N0cnNjcHknIGluIHRoaXMKPiBzdWJzeXN0ZW0uIENv
bnZlcnNpb24gaXMgMToxIGJlY2F1c2UgdGhlIHJldHVybiB2YWx1ZSBpcyBub3QgdXNlZC4KPiBH
ZW5lcmF0ZWQgYnkgYSBjb2NjaW5lbGxlIHNjcmlwdC4KPgo+IExpbms6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3IvQ0FIay09d2dmUm5YejBXM0QzN2QwMXEzSkZrcl9pX3VUTD1WNkE2RzFvVVpj
cHJta253QG1haWwuZ21haWwuY29tLwo+IFNpZ25lZC1vZmYtYnk6IFdvbGZyYW0gU2FuZyA8d3Nh
K3JlbmVzYXNAc2FuZy1lbmdpbmVlcmluZy5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbmV0L1NwYWNl
LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvbmV0L2Jv
bmRpbmcvYm9uZF9tYWluLmMgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvbmV0
L2Nhbi9zamExMDAwL3BlYWtfcGNtY2lhLmMgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMv
bmV0L2Nhbi91c2IvcGVha191c2IvcGNhbl91c2JfY29yZS5jICAgICB8ICAyICstCj4gIGRyaXZl
cnMvbmV0L2RzYS9iNTMvYjUzX2NvbW1vbi5jICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGRy
aXZlcnMvbmV0L2RzYS9iY21fc2YyX2NmcC5jICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4g
IGRyaXZlcnMvbmV0L2RzYS9oaXJzY2htYW5uL2hlbGxjcmVlay5jICAgICAgICAgICB8ICAyICst
Cj4gIGRyaXZlcnMvbmV0L2RzYS9tdjg4ZTZ4eHgvY2hpcC5jICAgICAgICAgICAgICAgICB8ICAy
ICstCj4gIGRyaXZlcnMvbmV0L2R1bW15LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAyICstCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0LzNjb20vM2M1MDkuYyAgICAgICAgICAgICAg
ICB8ICAyICstCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0LzNjb20vM2M1MTUuYyAgICAgICAgICAg
ICAgICB8ICAyICstCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0LzNjb20vM2M1ODlfY3MuYyAgICAg
ICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0LzNjb20vM2M1OXguYyAgICAg
ICAgICAgICAgICB8ICA2ICsrKy0tLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC8zY29tL3R5cGhv
b24uYyAgICAgICAgICAgICAgfCAgOCArKysrLS0tLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC84
MzkwL2F4ODg3OTYuYyAgICAgICAgICAgICAgfCAgNiArKystLS0KPiAgZHJpdmVycy9uZXQvZXRo
ZXJuZXQvODM5MC9ldGhlcmguYyAgICAgICAgICAgICAgIHwgIDYgKysrLS0tCj4gIGRyaXZlcnMv
bmV0L2V0aGVybmV0L2FkYXB0ZWMvc3RhcmZpcmUuYyAgICAgICAgICB8ICA0ICsrLS0KPiAgZHJp
dmVycy9uZXQvZXRoZXJuZXQvYWVyb2ZsZXgvZ3JldGguYyAgICAgICAgICAgIHwgIDQgKystLQo+
ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9hZ2VyZS9ldDEzMXguYyAgICAgICAgICAgICAgfCAgNCAr
Ky0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L2FsYWNyaXRlY2gvc2xpY29zcy5jICAgICAgICB8
ICA0ICsrLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvYWxsd2lubmVyL3N1bjRpLWVtYWMuYyAg
ICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9hbHRlb24vYWNlbmljLmMgICAg
ICAgICAgICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L2FtYXpvbi9lbmEvZW5h
X2V0aHRvb2wuYyAgICB8ICA0ICsrLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvYW1hem9uL2Vu
YS9lbmFfbmV0ZGV2LmMgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvYW1kL2Ft
ZDgxMTFlLmMgICAgICAgICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9h
bWQvYXUxMDAwX2V0aC5jICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5l
dC9hbWQvbm1jbGFuX2NzLmMgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL25ldC9ldGhl
cm5ldC9hbWQvcGNuZXQzMi5jICAgICAgICAgICAgICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvbmV0
L2V0aGVybmV0L2FtZC9zdW5sYW5jZS5jICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMv
bmV0L2V0aGVybmV0L2FtZC94Z2JlL3hnYmUtZXRodG9vbC5jICAgICB8ICA0ICsrLS0KPiAgLi4u
L25ldC9ldGhlcm5ldC9hcXVhbnRpYS9hdGxhbnRpYy9hcV9ldGh0b29sLmMgIHwgIDIgKy0KPiAg
ZHJpdmVycy9uZXQvZXRoZXJuZXQvYXJjL2VtYWNfbWFpbi5jICAgICAgICAgICAgIHwgIDIgKy0K
PiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvYXRoZXJvcy9hZzcxeHguYyAgICAgICAgICAgIHwgIDQg
KystLQo+ICAuLi4vbmV0L2V0aGVybmV0L2F0aGVyb3MvYXRsMWMvYXRsMWNfZXRodG9vbC5jICAg
fCAgNCArKy0tCj4gIC4uLi9uZXQvZXRoZXJuZXQvYXRoZXJvcy9hdGwxZS9hdGwxZV9ldGh0b29s
LmMgICB8ICA2ICsrKy0tLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9hdGhlcm9zL2F0bHgvYXRs
MS5jICAgICAgICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L2F0aGVyb3MvYXRs
eC9hdGwyLmMgICAgICAgICB8ICA2ICsrKy0tLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9icm9h
ZGNvbS9iNDQuYyAgICAgICAgICAgICAgfCAgNiArKystLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJu
ZXQvYnJvYWRjb20vYmNtNjN4eF9lbmV0LmMgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL25ldC9l
dGhlcm5ldC9icm9hZGNvbS9iY21zeXNwb3J0LmMgICAgICAgfCAgNCArKy0tCj4gIGRyaXZlcnMv
bmV0L2V0aGVybmV0L2Jyb2FkY29tL2JnbWFjLmMgICAgICAgICAgICB8ICA2ICsrKy0tLQo+ICBk
cml2ZXJzL25ldC9ldGhlcm5ldC9icm9hZGNvbS9ibngyLmMgICAgICAgICAgICAgfCAgNiArKyst
LS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvYnJvYWRjb20vYm54MngvYm54MnhfY21uLmMgIHwg
IDIgKy0KPiAgLi4uL25ldC9ldGhlcm5ldC9icm9hZGNvbS9ibngyeC9ibngyeF9ldGh0b29sLmMg
IHwgIDYgKysrLS0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L2Jyb2FkY29tL2JueDJ4L2JueDJ4
X21haW4uYyB8ICAyICstCj4gIC4uLi9uZXQvZXRoZXJuZXQvYnJvYWRjb20vYm54MngvYm54Mnhf
c3Jpb3YuaCAgICB8ICAyICstCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L2Jyb2FkY29tL2JueDJ4
L2JueDJ4X3ZmcGYuYyB8ICAyICstCj4gIC4uLi9uZXQvZXRoZXJuZXQvYnJvYWRjb20vYm54dC9i
bnh0X2V0aHRvb2wuYyAgICB8ICA4ICsrKystLS0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L2Jy
b2FkY29tL2JueHQvYm54dF92ZnIuYyAgICB8ICAyICstCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0
L2Jyb2FkY29tL2dlbmV0L2JjbWdlbmV0LmMgICB8ICAyICstCj4gIGRyaXZlcnMvbmV0L2V0aGVy
bmV0L2Jyb2FkY29tL3RnMy5jICAgICAgICAgICAgICB8ICA2ICsrKy0tLQo+ICBkcml2ZXJzL25l
dC9ldGhlcm5ldC9icm9jYWRlL2JuYS9ibmFkX2V0aHRvb2wuYyAgfCAgNiArKystLS0KPiAgZHJp
dmVycy9uZXQvZXRoZXJuZXQvY2F2aXVtL29jdGVvbi9vY3Rlb25fbWdtdC5jIHwgIDIgKy0KPiAg
Li4uL25ldC9ldGhlcm5ldC9jYXZpdW0vdGh1bmRlci9uaWN2Zl9ldGh0b29sLmMgIHwgIDQgKyst
LQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9jaGVsc2lvL2N4Z2IvY3hnYjIuYyAgICAgICAgfCAg
NCArKy0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L2NoZWxzaW8vY3hnYjMvY3hnYjNfbWFpbi5j
ICB8ICA0ICsrLS0KPiAgLi4uL25ldC9ldGhlcm5ldC9jaGVsc2lvL2N4Z2I0L2N4Z2I0X2V0aHRv
b2wuYyAgIHwgIDQgKystLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9jaGVsc2lvL2N4Z2I0L2N4
Z2I0X21haW4uYyAgfCAgNCArKy0tCj4gIC4uLi9uZXQvZXRoZXJuZXQvY2hlbHNpby9jeGdiNHZm
L2N4Z2I0dmZfbWFpbi5jICB8ICA0ICsrLS0KPiAgLi4uL2NoZWxzaW8vaW5saW5lX2NyeXB0by9j
aHRscy9jaHRsc19tYWluLmMgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvY2ly
cnVzL2VwOTN4eF9ldGguYyAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQv
Y2lzY28vZW5pYy9lbmljX2V0aHRvb2wuYyAgIHwgIDYgKysrLS0tCj4gIGRyaXZlcnMvbmV0L2V0
aGVybmV0L2Rhdmljb20vZG05MDAwLmMgICAgICAgICAgICB8ICA0ICsrLS0KPiAgZHJpdmVycy9u
ZXQvZXRoZXJuZXQvZGVjL3R1bGlwL2RlMjEwNHguYyAgICAgICAgIHwgIDQgKystLQo+ICBkcml2
ZXJzL25ldC9ldGhlcm5ldC9kZWMvdHVsaXAvZG1mZS5jICAgICAgICAgICAgfCAgNCArKy0tCj4g
IGRyaXZlcnMvbmV0L2V0aGVybmV0L2RlYy90dWxpcC90dWxpcF9jb3JlLmMgICAgICB8ICA0ICsr
LS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvZGVjL3R1bGlwL3VsaTUyNnguYyAgICAgICAgIHwg
IDQgKystLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9kZWMvdHVsaXAvd2luYm9uZC04NDAuYyAg
ICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L2RsaW5rL2RsMmsuYyAgICAgICAg
ICAgICAgICB8ICA0ICsrLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvZGxpbmsvc3VuZGFuY2Uu
YyAgICAgICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9kbmV0LmMgICAg
ICAgICAgICAgICAgICAgICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L2VtdWxl
eC9iZW5ldC9iZV9jbWRzLmMgICAgICB8IDEyICsrKysrKy0tLS0tLQo+ICBkcml2ZXJzL25ldC9l
dGhlcm5ldC9lbXVsZXgvYmVuZXQvYmVfZXRodG9vbC5jICAgfCAgNiArKystLS0KPiAgZHJpdmVy
cy9uZXQvZXRoZXJuZXQvZmFyYWRheS9mdGdtYWMxMDAuYyAgICAgICAgIHwgIDQgKystLQo+ICBk
cml2ZXJzL25ldC9ldGhlcm5ldC9mYXJhZGF5L2Z0bWFjMTAwLmMgICAgICAgICAgfCAgNCArKy0t
Cj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L2ZlYWxueC5jICAgICAgICAgICAgICAgICAgICB8ICA0
ICsrLS0KPiAgLi4uL25ldC9ldGhlcm5ldC9mcmVlc2NhbGUvZHBhYS9kcGFhX2V0aHRvb2wuYyAg
IHwgIDQgKystLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9mcmVlc2NhbGUvZHBhYTIvZHBhYTIt
bWFjLmMgfCAgMiArLQo+ICAuLi4vbmV0L2V0aGVybmV0L2ZyZWVzY2FsZS9lbmV0Yy9lbmV0Y19l
dGh0b29sLmMgfCAgNCArKy0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L2ZyZWVzY2FsZS9mZWNf
bWFpbi5jICAgICAgICB8ICA4ICsrKystLS0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L2ZyZWVz
Y2FsZS9mZWNfcHRwLmMgICAgICAgICB8ICAyICstCj4gIC4uLi9ldGhlcm5ldC9mcmVlc2NhbGUv
ZnNfZW5ldC9mc19lbmV0LW1haW4uYyAgICB8ICAyICstCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0
L2ZyZWVzY2FsZS9naWFuZmFyX2V0aHRvb2wuYyB8ICAyICstCj4gIC4uLi9uZXQvZXRoZXJuZXQv
ZnJlZXNjYWxlL3VjY19nZXRoX2V0aHRvb2wuYyAgICB8ICA0ICsrLS0KPiAgZHJpdmVycy9uZXQv
ZXRoZXJuZXQvZnVqaXRzdS9mbXZqMTh4X2NzLmMgICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJz
L25ldC9ldGhlcm5ldC9oaXNpbGljb24vaGlwMDRfZXRoLmMgICAgICAgfCAgNCArKy0tCj4gIGRy
aXZlcnMvbmV0L2V0aGVybmV0L2libS9laGVhL2VoZWFfZXRodG9vbC5jICAgICB8ICA0ICsrLS0K
PiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvaWJtL2VtYWMvY29yZS5jICAgICAgICAgICAgIHwgIDQg
KystLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9pYm0vaWJtdmV0aC5jICAgICAgICAgICAgICAg
fCAgNCArKy0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L2ludGVsL2UxMDAuYyAgICAgICAgICAg
ICAgICB8ICA0ICsrLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvaW50ZWwvZTEwMDAvZTEwMDBf
ZXRodG9vbC5jIHwgIDQgKystLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9pbnRlbC9lMTAwMGUv
ZXRodG9vbC5jICAgICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L2ludGVsL2Ux
MDAwZS9uZXRkZXYuYyAgICAgICB8ICA2ICsrKy0tLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9p
bnRlbC9pNDBlL2k0MGVfZXRodG9vbC5jICAgfCAgNiArKystLS0KPiAgZHJpdmVycy9uZXQvZXRo
ZXJuZXQvaW50ZWwvaTQwZS9pNDBlX21haW4uYyAgICAgIHwgMTYgKysrKysrKystLS0tLS0tLQo+
ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9pbnRlbC9pNDBlL2k0MGVfcHRwLmMgICAgICAgfCAgMiAr
LQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9pbnRlbC9pYXZmL2lhdmZfZXRodG9vbC5jICAgfCAg
NiArKystLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvaW50ZWwvaWdiL2lnYl9ldGh0b29sLmMg
ICAgIHwgIDYgKysrLS0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L2ludGVsL2lnYi9pZ2JfbWFp
bi5jICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L2ludGVsL2lnYnZmL2V0
aHRvb2wuYyAgICAgICB8ICA0ICsrLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvaW50ZWwvaXhn
Yi9peGdiX2V0aHRvb2wuYyAgIHwgIDQgKystLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9pbnRl
bC9peGdiZS9peGdiZV9ldGh0b29sLmMgfCAgNiArKystLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJu
ZXQvaW50ZWwvaXhnYmUvaXhnYmVfZmNvZS5jICAgIHwgIDIgKy0KPiAgZHJpdmVycy9uZXQvZXRo
ZXJuZXQvaW50ZWwvaXhnYmUvaXhnYmVfbWFpbi5jICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL25l
dC9ldGhlcm5ldC9pbnRlbC9peGdiZXZmL2V0aHRvb2wuYyAgICAgfCAgNCArKy0tCj4gIGRyaXZl
cnMvbmV0L2V0aGVybmV0L2ptZS5jICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICsrKy0tLQo+
ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9rb3JpbmEuYyAgICAgICAgICAgICAgICAgICAgfCAgNiAr
KystLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvbWFydmVsbC9tdjY0M3h4X2V0aC5jICAgICAg
IHwgIDggKysrKy0tLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvbWFydmVsbC9tdm5ldGEuYyAg
ICAgICAgICAgIHwgIDYgKysrLS0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L21hcnZlbGwvbXZw
cDIvbXZwcDJfbWFpbi5jICB8ICA2ICsrKy0tLQoKRm9yOiBkcml2ZXJzL25ldC9ldGhlcm5ldC9t
YXJ2ZWxsL212cHAyCgpBY2tlZC1ieTogTWFyY2luIFdvanRhcyA8bXdAc2VtaWhhbGYuY29tPgoK
VGhhbmtzLApNYXJjaW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
