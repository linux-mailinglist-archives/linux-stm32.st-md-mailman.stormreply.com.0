Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NW/KMx0zRmqQLgsAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Jul 2026 11:45:01 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDC96F56DE
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Jul 2026 11:45:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=CM1pHfbL;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A5BEC8F262;
	Thu,  2 Jul 2026 09:45:01 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB3ADC6C856
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2026 09:44:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id AFB1D60129
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2026 09:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4803B1F0156D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2026 09:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782985498;
 bh=ECZSUW9hSj34SFz4G8bfbFkApIByTwPPDgQgHBlg2lY=;
 h=From:In-Reply-To:References:Date:Subject:To:Cc;
 b=CM1pHfbLgxMYkSotRohphHAwfHiS2Jq6WgdNtLNVx9uS9WhtbtNpBou5sFbv3Zfbs
 t4EYEkBRrQ2RPOdC3sKXIYU/bXdz1i/2PmuYsFxoCMwyYQGcvrEq342mZyLtAsgOpG
 w/sfT7k5FjdRPizXj5j9sXzzoLSxaH4bXp0ZuISOJV1Aj9GCea4PDHBExCwb2cLFYk
 vD2m1iI2wTjiyqshwUVGQuj011ZBWZgfKMQS8l8tVqa50gCgevokuKhUvpXzlG1EZ+
 4tnuwDISjYXV/puQzCG1Qd5pr3KEdBJbwvMtN8gpQX6Ik/85EwSf3YqBWFGGYzSx4P
 2QjvHhzDq8Dhw==
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-39b26e2ad5eso15192201fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Jul 2026 02:44:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+RqYPwUIH+SCDBWct+v0EMDdyvzYi+qD90YiVyw5WSfLoNuOBZvSMl4df+4wG9SSng4Zl6ndeqZhTNuLvg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwdbiTW9DJsRcrYdM2XE5NkXA5M2eJVrgOUGfATxazg+CNI5kOK
 Ik+KnbSODem3Ps0JmoFpnYZUvCXcuZqBHxDcVtH+GnjJZUqZAny2QNBl7zGKQMKr0J+jQ2yfLkh
 lNQsboSdfxT2iaTRe9kMCiYBg80048N3P27dczLjfkQ==
X-Received: by 2002:a05:651c:2129:b0:39b:128e:ae5d with SMTP id
 38308e7fff4ca-39b36e539cdmr10506381fa.9.1782985496830; Thu, 02 Jul 2026
 02:44:56 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Jul 2026 04:44:55 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Jul 2026 04:44:55 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
 <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
 <akOZFIowVvprnAMf@vaman>
 <CAMRc=MfBcOhbj=ETxy2Xz9o_nyzykrEhKAc3jYi6V5_jMZEE3Q@mail.gmail.com>
 <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
Date: Thu, 2 Jul 2026 04:44:55 -0500
X-Gmail-Original-Message-ID: <CAMRc=MfwB_51OLjX_19eagZ1m3UUM2iHny5rx6besR6+Np_A0g@mail.gmail.com>
X-Gm-Features: AVVi8Cfm4QcPsY-kBu80DyHJVbYDW8Jkdy81l2_sPTIAALqyBLBgGUF_GjAGTTs
Message-ID: <CAMRc=MfwB_51OLjX_19eagZ1m3UUM2iHny5rx6besR6+Np_A0g@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: imx@lists.linux.dev, s32@nxp.com, Radu Rendec <rrendec@redhat.com>,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Magnus Damm <magnus.damm@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-rockchip@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-arm-msm@vger.kernel.org, Jan Petrous <jan.petrous@oss.nxp.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mips@vger.kernel.org,
 Drew Fustini <dfustini@tenstorrent.com>, sophgo@lists.linux.dev,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v11 1/7] dt-bindings: phy:
 document the serdes PHY on sa8255p
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,redhat.com,vger.kernel.org,google.com,lists.infradead.org,gmail.com,st-md-mailman.stormreply.com,baylibre.com,kernel.org,oss.qualcomm.com,bootlin.com,oss.nxp.com,tenstorrent.com,st.com,linaro.org,foss.st.com,lunn.ch,davemloft.net];
	RCPT_COUNT_TWELVE(0.00)[47];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:imx@lists.linux.dev,m:s32@nxp.com,m:rrendec@redhat.com,m:linux-kernel@vger.kernel.org,m:edumazet@google.com,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jbrunet@baylibre.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:khilman@baylibre.com,m:bartosz.golaszewski@oss.qualcomm.com,m:magnus.damm@gmail.com,m:jernej.skrabec@gmail.com,m:linux-rockchip@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:linux-sunxi@lists.linux.dev,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:jan.petrous@oss.nxp.com,m:mripard@kernel.org,m:linux-mips@vger.kernel.org,m:dfustini@tenstorrent.com,m:sophgo@lists.linux.dev,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:neil.armstrong@linaro.org,m:netdev@vger.kernel.org
 ,m:andersson@kernel.org,m:bartosz.golaszewski@linaro.org,m:christophe.roullier@foss.st.com,m:linux-renesas-soc@vger.kernel.org,m:andrew+netdev@lunn.ch,m:vkoul@kernel.org,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:shawnguo@kernel.org,m:davem@davemloft.net,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,linux-m68k.org:email,mail.gmail.com:mid];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5CDC96F56DE

On Thu, 2 Jul 2026 11:16:22 +0200, Geert Uytterhoeven
<geert@linux-m68k.org> said:
> Hi Bartosz,
>
> On Thu, 2 Jul 2026 at 11:12, Bartosz Golaszewski <brgl@kernel.org> wrote:
>> On Tue, 30 Jun 2026 12:23:16 +0200, Vinod Koul <vkoul@kernel.org> said:
>> > On 29-06-26, 16:51, Geert Uytterhoeven wrote:
>> >> > Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
>> >> > driver instead of the MAC driver where it was previously. Instead of cramming
>> >> > both HLOS and firmware handling into the same driver, I figured it makes more
>> >> > sense to have a dedicated, cleaner driver as the two share very little code (if
>> >> > any).
>> >>
>> >> I think you are mixing up DT bindings and driver implementation?
>> >
>> > Should the bindings change if we have different driver and firmware
>> > implementations? Isn't binding supposed to be agnostic of
>> > implementations..?
>>
>> I've thought about it some more and I believe this question is philosophical in
>> nature.
>>
>> sa8775p and sa8255p are *the same* hardware. I can flash different firmware on
>> the same Lemans Ride board and it becomes one or the other. Yet they are not
>> described by the same DTS and the bindings differ as well. I don't see why we
>> wouldn't allow the same approach for the this PHY.
>>
>> We treat it as different HW variant when it's managed by firmware - just like
>> we do with the rest of the SoC.
>
> DT describes hardware, not software policy.
>

I'll defer to DT maintainers then for that particular case because it affects
more than just this platform. For instance: Qualcomm Nord[1] is already being
upstreamed with a similar split into common parts and then sources specific to
the SCMI and non-SCMI variants - even though it's the same SoC.

Bartosz

[1] https://lore.kernel.org/all/20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
