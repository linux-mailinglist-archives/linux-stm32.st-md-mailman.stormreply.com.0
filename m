Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNdYH3LxeWnT1AEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 12:22:26 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C018A0401
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 12:22:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DE39C01FBF;
	Wed, 28 Jan 2026 11:22:25 +0000 (UTC)
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31D23C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 11:22:23 +0000 (UTC)
Received: by mail-dl1-f51.google.com with SMTP id
 a92af1059eb24-124a95e592fso325503c88.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 03:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769599341; x=1770204141;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QJUI8NJKVSDnIT+QSuw3y5qsdf/HcwP4R02WUPv/Zns=;
 b=Vd76G8Hh5a+odqxo0dLTCkC9QwC2AG1o2Mx+m4y7k6ZceZ6eRSzdKJI0hZ9VNEg7M4
 z0UCJDtSAkmj99yHAihaYEjQ3vL0SE4JRxGWy9RFXHwypc0T5qpQtVGtn4xvWv1Isby0
 0XqLpFnjKWZjEIuSPjMkZFtNWKAQEZaMH7jt99Mwbd1HXoYl7d/xoiyjcU67fQBt91ZX
 kPc4uX+uMG5ZrFgtsarex426sD4fdu4CQB5sQTES129mSa/W+Z2mmgWd2j8nQIAooK4C
 rBxPBO4oG0Ml+SwlQN9gbnQ58WLQo6ETRPf7bCEgBHS6E2LYpqp4p4mIJFk3Pp1XaXzP
 rLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769599341; x=1770204141;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QJUI8NJKVSDnIT+QSuw3y5qsdf/HcwP4R02WUPv/Zns=;
 b=BOlzEMdR5cRTOpZqplj/GdzA5LQNUfwErlgzubsdTxEdIi6d5Gz7okJmipuQGwnbiS
 qMB5xJYNokuuEgb/HgDwe7y1s1HPw18St/TVgMwp7/sATtnQ7QW9t1wuYmxZImzchvDf
 6NzMmmOcfW373HFPB3WAXVfDAMg8uxhiqSSyvKYh46NYjTNq+QLZeeBk75nV7Nn1h7Ob
 hgAbp57deqXyomhxn9OR2a1xLB+qOJUhdbQTJFl9gxddtofwUgjroCHON6MG0qwaoQIf
 EX5giD/le3/TNoEB7CvQfGgCjh/SpgE5oZ0ZDz3NbichqZmxgKgUiT+ijcmbffg5/xpp
 OkDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKQBHV+g2z59JKdoWhrElAN83bc8oAcEdm2E4U0P+Pn8HjEuqDQv3laNuXeLgZXj6LiUlt5Jwsx9hb7Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx4TLnq6IqVBP0FT7CzB8lU89ZpKDD6Til+gV+1QmW4l358RuZW
 Q0E2Qocks42TquPrK98LYqO2vmxsVv5Jnhl7yz27iXht+9lOt+TooCYn
X-Gm-Gg: AZuq6aLBjorfRmeNenAqWIVjVhleZFF0wSQseSbBg+VjWjQRvQcwEtfeZCmtxS0c0fW
 QbtdkBRMYWsUKr7gMjixkdtUiR0PwLTQs0Z/WiYGDA8X08+sMvwOXSKaUEXlkDvGJmjFdAQTCcB
 +65bhSPUERMQDtzCcdSTpGsfv/3RHP02tD3P+cChgT+vFg41HU5HJNB7/94CO1/2mqeCKh0UCB/
 cAuXVYanPS++Qx4F3u1zJgaR3cNYTaVH9y5SNqN7jOJ+gru1lkGjaErZRbXugeKW9t2ftD6oWQg
 oaN+x45NsTE6pwEhXu/EjJxGypmXLInMg4Px+dFuw3oivofJQUQ7xfsjvZ5Gn3yGvTddS8V08/0
 26wgDr022lWrpGCc7uRvUjXnVJR9vB6Hi21s81Lp4GAABHdRxaDihgijCKEC6NTSVjpgytgiQ51
 aSrDxhmUbx4w==
X-Received: by 2002:a05:7022:eb47:20b0:11d:fd26:234e with SMTP id
 a92af1059eb24-124a0070cbdmr2385944c88.16.1769599341399; 
 Wed, 28 Jan 2026 03:22:21 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b7a16cf8d6sm2140833eec.3.2026.01.28.03.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 03:22:20 -0800 (PST)
Date: Wed, 28 Jan 2026 19:22:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vivian Wang <wangruikang@iscas.ac.cn>, 
 Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Yixun Lan <dlan@gentoo.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Yao Zi <ziyao@disroot.org>, Yanteng Si <siyanteng@cqsoftware.com.cn>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Chen-Yu Tsai <wens@kernel.org>, 
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Message-ID: <aXnxDlExQRYrbf6s@inochi.infowork>
References: <20260128072931.875041-1-inochiama@gmail.com>
 <20260128072931.875041-4-inochiama@gmail.com>
 <f73fc83c-b38d-4974-ba3c-80c5e5556e7e@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f73fc83c-b38d-4974-ba3c-80c5e5556e7e@iscas.ac.cn>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac: Add glue
 layer for Spacemit K3 SoC
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wangruikang@iscas.ac.cn,m:inochiama@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dlan@gentoo.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:richardcochran@gmail.com,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:rmk+kernel@armlinux.org.uk,m:ziyao@disroot.org,m:siyanteng@cqsoftware.com.cn,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:maxime.chevallier@bootlin.com,m:yong.liang.choong@linux.intel.com,m:wens@kernel.org,m:weishangjuan@eswincomputing.com,m:boon.khai.ng@altera.com,m:quentin.schulz@cherry.de,m:peppe.cavallaro@st.com,m:joabreu@synopsys.com,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:looong.bin@gmail.com,m:linux-riscv@lists.infradead.org,m:spacemit@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lis
 ts.infradead.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,m:looongbin@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[iscas.ac.cn,gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gentoo.org,foss.st.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,armlinux.org.uk,disroot.org,cqsoftware.com.cn,bp.renesas.com,bootlin.com,linux.intel.com,eswincomputing.com,altera.com,cherry.de,st.com,synopsys.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.infradead.org,lists.linux.dev,st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[inochi.infowork:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 9C018A0401
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 05:16:46PM +0800, Vivian Wang wrote:
> Hi Inochi,
> =

> I have some comments below.
> =

> On 1/28/26 15:29, Inochi Amaoto wrote:
> > The etherenet controller on Spacemit K3 SoC is Synopsys DesignWare
> Typo: etherenet -> ethernet
> > MAC (version 5.40a), with the following special point:
> Nit: point -> points=A0

Thanks

> > 1. The rate of the tx clock line is auto changed when the mac speed
> >    rate is changed, and no need for changing the input tx clock.
> > 2. This controller require a extra syscon device to configure the
> >    interface type, enable wake up interrupt and delay configuration
> >    if needed.
> >
> > Add Spacemit dwmac driver support on the Spacemit K3 SoC.
> >
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
> >  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> >  .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 218 ++++++++++++++++++
> >  3 files changed, 231 insertions(+)
> >  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> >
> > [...]
> >
> > +
> > +/* dline register bits */
> > +#define RGMII_RX_DLINE_EN		BIT(0)
> > +#define RGMII_RX_DLINE_STEP		GENMASK(5, 4)
> > +#define RGMII_RX_DLINE_CODE		GENMASK(15, 8)
> > +#define RGMII_TX_DLINE_EN		BIT(16)
> > +#define RGMII_TX_DLINE_STEP		GENMASK(21, 20)
> > +#define RGMII_TX_DLINE_CODE		GENMASK(31, 24)
> > +
> > +#define MAX_DLINE_DELAY_CODE		0xff
> > +#define MAX_WORKED_DELAY		2800
> > +
> > +/* Note: the delay step value is at 0.1ps */
> > +static const unsigned int k3_delay_step_10x[4] =3D {
> > +	367, 493, 559, 685
> > +};
> > +
> > +static int spacemit_dwmac_set_delay(struct regmap *apmu,
> > +				    unsigned int dline_offset,
> > +				    unsigned int tx_code, unsigned int tx_config,
> > +				    unsigned int rx_code, unsigned int rx_config)
> > +{
> > +	unsigned int mask, val;
> > +
> > +	mask =3D RGMII_TX_DLINE_STEP | RGMII_TX_DLINE_CODE | RGMII_TX_DLINE_E=
N |
> > +	       RGMII_RX_DLINE_STEP | RGMII_RX_DLINE_CODE | RGMII_RX_DLINE_EN;
> > +	val =3D FIELD_PREP(RGMII_TX_DLINE_STEP, tx_config) |
> > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, tx_code) | RGMII_TX_DLINE_EN |
> > +	      FIELD_PREP(RGMII_RX_DLINE_STEP, rx_config) |
> > +	      FIELD_PREP(RGMII_RX_DLINE_CODE, rx_code) | RGMII_RX_DLINE_EN;
> > +
> > +	return regmap_update_bits(apmu, dline_offset, mask, val);
> > +}
> > +
> > +static int spacemit_dwmac_detected_delay_value(unsigned int delay,
> > +					       unsigned int *config)
> > +{
> > +	unsigned int best_delay =3D 0;
> > +	unsigned int best_config =3D 0;
> > +	int best_code =3D 0;
> > +	int i;
> > +
> > +	if (delay =3D=3D 0)
> > +		return 0;
> > +
> > +	if (delay > MAX_WORKED_DELAY)
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * Note K3 require a specific factor for calculate
> > +	 * the delay, in this scenario it is 0.9. So the
> > +	 * formula is code * step / 10 * 0.9
> > +	 */
> > +	for (i =3D 0; i < ARRAY_SIZE(k3_delay_step_10x); i++) {
> > +		unsigned int step =3D k3_delay_step_10x[i];
> > +		int code =3D DIV_ROUND_CLOSEST(delay * 10 * 10, step * 9);
> > +		unsigned int tmp =3D code * step * 9 / 10 / 10;
> > +
> > +		if (abs(tmp - delay) < abs(best_delay - delay)) {
> > +			best_code =3D code;
> > +			best_delay =3D tmp;
> > +			best_config =3D i;
> > +		}
> > +	}
> > +
> > +	*config =3D best_config;
> > +
> > +	return best_code;
> =

> Is this really necessary? For K1 I just used the smallest step size.
> =

> It seems to me you have, for the smallest step size, about 36.7ps * 0.9
> =3D 33ps per step. Theoretically speaking that lets you fine tune the
> delay to within 1% of the 2ns total required RGMII delay (MAC + PCB +
> PHY). In practice this number shouldn't be that marginal.=A0
> =


I think it is reasonable, I will take you advice and use the
smallest step size.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
