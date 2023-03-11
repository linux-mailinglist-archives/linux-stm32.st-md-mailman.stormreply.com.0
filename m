Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB416B5914
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Mar 2023 07:49:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66D6FC6A60C;
	Sat, 11 Mar 2023 06:49:26 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4ED39C640E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Mar 2023 06:49:25 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id bw19so6955861wrb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 22:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678517365;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=t9Sei6I41qwaNDpvUvee9z5C91oyEDGNKLdeZYKLxNI=;
 b=edANvY7i593vAONZaHOUC5NiTyvSEIOaEbRI65vr3O9TxYv0ucfrHbTN/3kKRE+Tkj
 kTzD5JZupdMhbGi/9AnNNPmHiuE08jI/tDmN55s78utBRjPSG+l0RbEZnCYPcGD+Tz1T
 70SRtuq64yUALwEsep5xNXJc6oI5P3t6w/o40wW1OTAPugx9zilfGYPK0knap2c0m2im
 5Z/9gQAteGMZ+0W210gckbP716ypWMyoR+YjhAkCz7XgEa42CNrLjViIRviq6sj4NPdo
 QyuS+vIB0RIRQYRmiUSeCbnb6/CwiOy5Ih0xqHu+CFxbOLzMgGWScerqv1Gusqg8th2l
 zYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678517365;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t9Sei6I41qwaNDpvUvee9z5C91oyEDGNKLdeZYKLxNI=;
 b=Gkcw/fRsl2f6JebPmY5OxuAtl2B1H1Oomnp3Ak7IMSGmcGnrGul34UbEg2FC6jEHYK
 k5XCM20teHTtwIbLvzQNY2PUp3qfwupDwAp6JuBPa/W2RWct89cNOTEjDkvu+t3PB3zx
 Xw11H2W5FP3NXIS/hzVwPar4bK/vqmhnj57nqUGLpkf/7UajGtNIxg2Hs9u0rhpjNFsu
 4UJpkfjkdH2/cEjvIqfslGBFttpGcuthIDyIYCseHA7JoZc42AVPjpJlXuiVuD5SMync
 RR5S4bp0ld72pE4Z7TSAyYsME/O2lu5R8Ez1I6UmYJ5kCMHQslEclO4BGkcRFl7NeE6W
 iZVQ==
X-Gm-Message-State: AO0yUKWyjf2mw0jTr0kFzi0SIqTNgVlQoYnM8JUpC+GH28F++HTaaeuI
 /WK6PSjbqRQ+/zctyqKVohU=
X-Google-Smtp-Source: AK7set/JPr6Wq2tfBtyFn0d5vMSSusNpNT1n3m5tdIocxlx8YgFkE6JLYZ5AoEW5KjyXe2yJU0ieQQ==
X-Received: by 2002:a5d:4a8c:0:b0:2c7:d7ca:4c88 with SMTP id
 o12-20020a5d4a8c000000b002c7d7ca4c88mr18447829wrq.55.1678517364619; 
 Fri, 10 Mar 2023 22:49:24 -0800 (PST)
Received: from ?IPv6:2a02:168:6806:0:c51d:786:86a8:fd19?
 ([2a02:168:6806:0:c51d:786:86a8:fd19])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a5d4bc2000000b002c57475c375sm1584656wrt.110.2023.03.10.22.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 22:49:24 -0800 (PST)
Message-ID: <bff0e542b8c04980e9e3af1d3e6bf739c87eb514.camel@gmail.com>
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Date: Sat, 11 Mar 2023 07:49:23 +0100
In-Reply-To: <4abd56aa-5b9f-4e16-b0ca-11989bb8c764@lunn.ch>
References: <20230116-net-next-remove-probe-capabilities-v2-4-15513b05e1f4@walle.cc>
 <449bde236c08d5ab5e54abd73b645d8b29955894.camel@gmail.com>
 <100c439a-2a4d-4cb2-96f2-5bf273e2121a@lunn.ch>
 <712bc92ca6d576f33f63f1e9c2edf0030b10d3ae.camel@gmail.com>
 <db6b8a09-b680-4baa-8963-d355ad29eb09@lunn.ch>
 <0e10aa8492eadb587949d8744b56fccaabbd183b.camel@gmail.com>
 <72530e86-9ba9-4a01-9cd2-68835ecae7a0@lunn.ch>
 <09d65e1ee0679e1e74b4f3a5a4c55bd48332f043.camel@gmail.com>
 <70f5bca0-322c-4bae-b880-742e56365abe@lunn.ch>
 <10da10caea22a8f5da8f1779df3e13b948e8a363.camel@gmail.com>
 <4abd56aa-5b9f-4e16-b0ca-11989bb8c764@lunn.ch>
User-Agent: Evolution 3.46.4-1 
MIME-Version: 1.0
Cc: linux-aspeed@lists.ozlabs.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>,
 Joel Stanley <joel@jms.id.au>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Andrew Jeffery <andrew@aj.id.au>,
 Bryan Whitehead <bryan.whitehead@microchip.com>, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Michael Walle <michael@walle.cc>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [Linux-stm32] [PATCH net-next v2 4/6] net: mdio: scan bus based
 on bus capabilities for C22 and C45
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

On Sat, 2023-03-11 at 00:49 +0100, Andrew Lunn wrote:
> > Yes, that helps. Primarily, because mdiobus_scan_bus_c45 now is called only once,
> > and at least some things are done in parallel.
> 
> Great. Could you cook up a proper patch and submit it?

I can give it a try. The commit message will be from my perspective,
and the change Suggested-By you.

Best regards, Klaus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
