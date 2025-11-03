Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBA5C2B947
	for <lists+linux-stm32@lfdr.de>; Mon, 03 Nov 2025 13:13:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50946C62D2D;
	Mon,  3 Nov 2025 12:13:59 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8808CC628DE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Nov 2025 12:13:58 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-472cbd003feso5078345e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Nov 2025 04:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762172038; x=1762776838;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HvThRY4eNfW5Inji/W0VKFrAjmGKVWgkAa2RGmz2+O0=;
 b=gnd52fei2Mb4oQJ5ByShU2A7uF9M9lN6BMjjnVIZLVXED0LTHZw2YHWL/8fGBSxIzG
 8xMHMf5uswZ4ObvOxRqzO/wU7tQH3gVBZmgMLxXaCHK/wwg3Zf7ZO/zXMwAu0w17HBhJ
 wt2dYBEucVA/lP6A1k7ljjaUDYIa+ywWEfAmiU3D+hhDnF7SgD0qxbh4YxzukSBOLDYO
 roDAziJGNP/om+IZicHVhNOawfVYQSfIgc8jmif97a6/VWCqetOHhbzzda1FiE2wLq62
 5iF3rtv8ZuAB4pcGxM/fS5nmGDm1DLrv3ufZ369k0KH+0vpv3v9POZWlb2V4R0xn0jEC
 H2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762172038; x=1762776838;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HvThRY4eNfW5Inji/W0VKFrAjmGKVWgkAa2RGmz2+O0=;
 b=e/pgyX6r6wl7UhpCh4GnQklJzQVtuAwUtQ0pIZJbq5eHhXSMdIoAkttPmF9Gl3kHJN
 tHHl3T1kEE7A2fTtUNkUZ76RhLysxcg6YEHljP8s+AtaWZciAe6MjCe69rlFGfzvwT14
 3athjcmtJAcHUVHdpC6FQlir8ispHxckNW8h0nUeqgma4aw4np9j+s9/D4Qp49v6rodj
 jAbfPOFKoTjm2XzMLIQnMO0KmpXXZDDFLsWF8cxwpflwmF+XIrUYI5FsHlzLPtm44FgS
 x5OenEycxbYBB/o3BHpYtu5m4OGvmuUjQ6iIoi+GJ7O5DpUp1ANowu5T5v/matq7f/CT
 rQQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUku+COipM0UXlla0mqaD1gDZEdNvFgkRvwnG3nQsgpnOR188qsq0vZK9WDpyn4V/5q4/TrNVT5B11Zkw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw5TihzzBPXN9cpWBMCBOBaHzSTpehM4UkYooCgiJ88Fxy6Zb4o
 AOzlg76atkOidYtzfyQbwHnPLYRxD0hYfT0IXPTf2WBNjOjjglpXmSjH
X-Gm-Gg: ASbGncuPwc5FSm9nKc3qEHBsK9FSSjEPVWRRhCe/7jns6ggJwJsATeE+kRAs4UbqKLT
 GwipGFHE2p1tJoFUnLC/p/qyV34aMGb8qvwfyW9UyF/ukvgKeX7Nut4iwBDMUmuK0wsE55huXOB
 ec05tvV71UmDqytnsi8qKb5VD/3297d7TyI/onM/V/s056T2bSOsx58j47nqLPyTBGP55Lc2+uO
 YqUw4wiebRCDGQDFjfzn/hvZ22Lm6QbyyEkV4u04XHFeZLR6tD25AzhiUDbPe6eJ7XkblMQ+CDi
 iYInonVpN+0yktfXQmYXwViCIW0hHDb5oVaiuG4vImPKPay8JhFi4wB5hUWr1shVkRVwgn/OqMR
 /jvDG/9Rl0j2ofyD0Any67Db2/3BUQ+ftlCR6GiZb87vpax3E3YhBOzeCU1Vxxce3tYmxwD0EM6
 SMnXY=
X-Google-Smtp-Source: AGHT+IGQt2Q95D+Meobm86HVWwUHLHSku+aRz/VeZME+I3ZAsJ3m+6wdDTCQZ+nPhU3uPW8S3WqRpQ==
X-Received: by 2002:a05:600c:19c6:b0:477:10c4:b52 with SMTP id
 5b1f17b1804b1-4773090238fmr57140915e9.8.1762172037406; 
 Mon, 03 Nov 2025 04:13:57 -0800 (PST)
Received: from skbuf ([2a02:2f04:d406:ee00:7144:c922:dc8a:113d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c23b8d9sm173739975e9.0.2025.11.03.04.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 04:13:56 -0800 (PST)
Date: Mon, 3 Nov 2025 14:13:53 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20251103121353.dbnalfub5mzwad62@skbuf>
References: <aQHc6SowbWsIA1A5@shell.armlinux.org.uk>
 <aQNmM5+cptKllTS8@oss.qualcomm.com>
 <aQOB_yCzCmAVM34V@shell.armlinux.org.uk>
 <aQOCpG_gjJlnm0A1@shell.armlinux.org.uk>
 <aQhusPX0Hw9ZuLNR@oss.qualcomm.com>
 <aQh7Zj10C7QcDoqn@shell.armlinux.org.uk>
 <aQiBjYNtJks2/mrw@oss.qualcomm.com>
 <20251103104820.3fcksk27j34zu6cg@skbuf>
 <aQiP46tKUHGwmiTo@oss.qualcomm.com>
 <aQiVWydDsRaMz8ua@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="56qp7pmq6cw7fsz2"
Content-Disposition: inline
In-Reply-To: <aQiVWydDsRaMz8ua@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Furong Xu <0x1207@gmail.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Daniel Machon <daniel.machon@microchip.com>,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>,
 Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: phylink PCS
 conversion part 3 (dodgy stuff)
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
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--56qp7pmq6cw7fsz2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 03, 2025 at 11:43:23AM +0000, Russell King (Oracle) wrote:
> On Mon, Nov 03, 2025 at 04:50:03PM +0530, Mohd Ayaan Anwar wrote:
> > On Mon, Nov 03, 2025 at 12:48:20PM +0200, Vladimir Oltean wrote:
> > > 
> > > As Russell partially pointed out, there are several assumptions in the
> > > Aquantia PHY driver and in phylink, three of them being that:
> > > - rate matching is only supported for PHY_INTERFACE_MODE_10GBASER and
> > >   PHY_INTERFACE_MODE_2500BASEX (thus not PHY_INTERFACE_MODE_SGMII)
> > > - if phy_get_rate_matching() returns RATE_MATCH_NONE for an interface,
> > >   pl->phy_state.rate_matching will also be RATE_MATCH_NONE when using
> > >   that interface
> > > - if rate matching is used, the PHY is configured to use it for all
> > >   media speeds <= phylink_interface_max_speed(link_state.interface)
> > > 
> > > Those assumptions are not validated very well against the ground truth
> > > from the PHY provisioning, so the next step would be for us to see that
> > > directly.
> > > 
> > > Please turn this print from aqr_gen2_read_global_syscfg() into something
> > > visible in dmesg, i.e. by replacing phydev_dbg() with phydev_info():
> > > 
> > > 		phydev_dbg(phydev,
> > > 			   "Media speed %d uses host interface %s with %s\n",
> > > 			   syscfg->speed, phy_modes(syscfg->interface),
> > > 			   syscfg->rate_adapt == AQR_RATE_ADAPT_NONE ? "no rate adaptation" :
> > > 			   syscfg->rate_adapt == AQR_RATE_ADAPT_PAUSE ? "rate adaptation through flow control" :
> > > 			   syscfg->rate_adapt == AQR_RATE_ADAPT_USX ? "rate adaptation through symbol replication" :
> > > 			   "unrecognized rate adaptation type");
> > 
> > Thanks. Looks like rate adaptation is only provisioned for 10M, which
> > matches my observation where phylink passes the exact speeds for
> > 100/1000/2500 but 1000 for 10M.
> 
> Hmm, I wonder what the PHY is doing for that then. stmmac will be
> programmed to read the Cisco SGMII in-band control word, and use
> that to determine whether symbol replication for slower speeds is
> being used.
> 
> If AQR115C is indicating 10M in the in-band control word, but is
> actually operating the link at 1G speed, things are not going to
> work, and I would say the PHY is broken to be doing that. The point
> of the SGMII in-band control word is to tell the MAC about the
> required symbol replication on the link for transmitting the slower
> data rates over the link.
> 
> stmmac unfortunately doesn't give access to the raw Cisco SGMII
> in-band control word. However, reading register 0xf8 bits 31:16 for
> dwmac4, or register 0xd8 bits 15:0 for dwmac1000 will give this
> information. In that bitfield, bits 2:1 give the speed. 2 = 1G,
> 1 = 100M, 0 = 10M.

It might be Linux who is forcing the AQR115C into the nonsensical
behaviour of advertising 10M in the SGMII control word while
simultanously forcing the PHY MII to operate at 1G with flow control
for the 10M media speed.

We don't control the latter, but we do control the former:
aqr_gen2_config_inband(), if given modes == LINK_INBAND_ENABLE, will
enable in-band for all media speeds that use PHY_INTERFACE_MODE_SGMII.
Regardless of how the PHY was provisioned for each media speed, and
especially regardless of rate matching settings, this function will
uniformly set the same in-band enabled/disabled setting for all media
speeds using the same host interface.

If dwmac_integrated_pcs_inband_caps(), as per Russell's patch 1/3,
reports LINK_INBAND_ENABLE | LINK_INBAND_DISABLE, and if
aqr_gen2_inband_caps() also reports LINK_INBAND_ENABLE | LINK_INBAND_DISABLE,
then we're giving phylink_pcs_neg_mode() all the tools it needs to shoot
itself in the foot, and select LINK_INBAND_ENABLE.

The judgement call in the Aquantia PHY driver was mine, as documented in
commit 5d59109d47c0 ("net: phy: aquantia: report and configure in-band
autoneg capabilities"). The idea being that the configuration would have
been unsupportable anyway given the question that the framework asks:
"does the PHY use in-band for SGMII, or does it not?"

Assuming the configuration at 10Mbps wasn't always broken, there's only
one way to know how it was supposed to work: more dumping of the initial
provisioning, prior to our modification in aqr_gen2_config_inband().
Ayaan, please re-print the same info with this new untested patch applied.
I am going to assume that in-band autoneg isn't enabled in the unmodified
provisioning, at least for 10M.

Russell's request for the integrated PCS status is also a good parallel
confirmation that yes, we've entered a mode where the PHY advertises
SGMII replication at 10M.

--56qp7pmq6cw7fsz2
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-net-phy-aquantia-add-inband-setting-to-the-aqr_gen2_.patch"

From b91162e5dae8e20b477999c4f2fcdb98c219d663 Mon Sep 17 00:00:00 2001
From: Vladimir Oltean <vladimir.oltean@nxp.com>
Date: Mon, 3 Nov 2025 14:03:55 +0200
Subject: [PATCH] net: phy: aquantia: add inband setting to the
 aqr_gen2_read_global_syscfg() print

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/phy/aquantia/aquantia_main.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
index 41f3676c7f1e..f06b7b51bb7d 100644
--- a/drivers/net/phy/aquantia/aquantia_main.c
+++ b/drivers/net/phy/aquantia/aquantia_main.c
@@ -839,6 +839,7 @@ static int aqr_gen2_read_global_syscfg(struct phy_device *phydev)
 
 	for (i = 0; i < AQR_NUM_GLOBAL_CFG; i++) {
 		struct aqr_global_syscfg *syscfg = &priv->global_cfg[i];
+		bool inband;
 
 		syscfg->speed = aqr_global_cfg_regs[i].speed;
 
@@ -849,6 +850,7 @@ static int aqr_gen2_read_global_syscfg(struct phy_device *phydev)
 
 		serdes_mode = FIELD_GET(VEND1_GLOBAL_CFG_SERDES_MODE, val);
 		rate_adapt = FIELD_GET(VEND1_GLOBAL_CFG_RATE_ADAPT, val);
+		inband = FIELD_GET(VEND1_GLOBAL_CFG_AUTONEG_ENA, val);
 
 		switch (serdes_mode) {
 		case VEND1_GLOBAL_CFG_SERDES_MODE_XFI:
@@ -896,12 +898,13 @@ static int aqr_gen2_read_global_syscfg(struct phy_device *phydev)
 		}
 
 		phydev_dbg(phydev,
-			   "Media speed %d uses host interface %s with %s\n",
+			   "Media speed %d uses host interface %s with %s, inband %s\n",
 			   syscfg->speed, phy_modes(syscfg->interface),
 			   syscfg->rate_adapt == AQR_RATE_ADAPT_NONE ? "no rate adaptation" :
 			   syscfg->rate_adapt == AQR_RATE_ADAPT_PAUSE ? "rate adaptation through flow control" :
 			   syscfg->rate_adapt == AQR_RATE_ADAPT_USX ? "rate adaptation through symbol replication" :
-			   "unrecognized rate adaptation type");
+			   "unrecognized rate adaptation type",
+			   str_enabled_disabled(inband));
 	}
 
 	return 0;
-- 
2.43.0


--56qp7pmq6cw7fsz2
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--56qp7pmq6cw7fsz2--
