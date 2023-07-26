Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F07763E06
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 20:00:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68C45C6B45C;
	Wed, 26 Jul 2023 18:00:10 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE222C6B459
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 18:00:08 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-66d6a9851f3so27857b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 11:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690394407; x=1690999207;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pBrqRf9KetYwqqw9kE2OBONwOaipxgqPSXo8Gqyj3es=;
 b=BJugwYfk9LHDG/VPjAGZ96UsiwDn8TCeZ9LCCV0vdU+A86oCwErSafXPcRTlt4wyHH
 olEKlDsp5tCv9J+gTP/BCdtUV1gH+RSTCHx3QU5HZaWkvSMVDcnHbt0HTDCMOpGiNsVE
 KyyFCDdEclB2qjuRpur33Oh2MGejJdqA7Pfq6/FOgmiHLUK7/y5O6PIXfnfP6kye5GyV
 uEf8nCHvAvLC4zwWtjhSolGUu8oBsiIviNL8P5VLKgQCOepoWWgti5/7n7qeNhc9amP9
 wgNYW8PGLhnvtR+Aax5NdsXZYVoX8zScB/0xptN72pTMS2Pro4MsWraYmL2WqtGk/Mrl
 xVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690394407; x=1690999207;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pBrqRf9KetYwqqw9kE2OBONwOaipxgqPSXo8Gqyj3es=;
 b=BgAiO7IyscQU975Wu9y6jZotOFByRsjoML7GmRe29Fm7fqtD4/qM6GTqDcw+FS4wfz
 9ZncrdxsD/qbl5wmo7EN3ZRlnJrGgXfi+Of06PmWT3FHWlUxkTlpWngGMVg8pXljnt1j
 OHvamOV6n7IA/w3WcgIRqgHvpJoZelUEdrd2WTnzpbMlEpxEr+NBuouOqhD+1MVlzSsT
 4qS99k32Ju/JTcGXZe0SaFDRUrp5ACLLKFhc9WQg2KOBp4vjlohsDpqXlqPZdLU0qFAT
 sV1vhiaOJ/wW+Vv/Jq30n145IEa3KKrTBo+flfko33MFX2h0fx++w/LuTL12BocPhT3o
 zykQ==
X-Gm-Message-State: ABy/qLZuotQXDiXwOpUb6Z+4EKp7tx1U2PUBBeHemibaZpyJcTZCFFE9
 QgzM/GBimEPMr3Lu94wI1Gk=
X-Google-Smtp-Source: APBJJlG559OmZQOAWOCS2hhWRYItf+2S/u6gwpf8Y2j8REtyCHKh5CtnNq+MNgm4Zg9WsYQYl0arUg==
X-Received: by 2002:a05:6a00:2d82:b0:675:8627:a291 with SMTP id
 fb2-20020a056a002d8200b006758627a291mr2820706pfb.3.1690394407071; 
 Wed, 26 Jul 2023 11:00:07 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2601:640:8000:54:e2d5:5eff:fea5:802f])
 by smtp.gmail.com with ESMTPSA id
 i8-20020aa78d88000000b006765cb32558sm11724126pfr.139.2023.07.26.11.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 11:00:06 -0700 (PDT)
Date: Wed, 26 Jul 2023 11:00:03 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Johannes Zink <j.zink@pengutronix.de>
Message-ID: <ZMFfI3xU5pkJW4x4@hoboy.vegasvil.org>
References: <20230719-stmmac_correct_mac_delay-v2-1-3366f38ee9a6@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230719-stmmac_correct_mac_delay-v2-1-3366f38ee9a6@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 kernel test robot <lkp@intel.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: correct MAC propagation
	delay
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

On Mon, Jul 24, 2023 at 12:01:31PM +0200, Johannes Zink wrote:

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
> index bf619295d079..d1fe4b46f162 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
> @@ -26,6 +26,12 @@
>  #define	PTP_ACR		0x40	/* Auxiliary Control Reg */
>  #define	PTP_ATNR	0x48	/* Auxiliary Timestamp - Nanoseconds Reg */
>  #define	PTP_ATSR	0x4c	/* Auxiliary Timestamp - Seconds Reg */
> +#define	PTP_TS_INGR_CORR_NS	0x58	/* Ingress timestamp correction nanoseconds */
> +#define	PTP_TS_EGR_CORR_NS	0x5C	/* Egress timestamp correction nanoseconds*/
> +#define	PTP_TS_INGR_CORR_SNS	0x60	/* Ingress timestamp correction subnanoseconds */
> +#define	PTP_TS_EGR_CORR_SNS	0x64	/* Egress timestamp correction subnanoseconds */

These two...

> +#define	PTP_TS_INGR_LAT	0x68	/* MAC internal Ingress Latency */
> +#define	PTP_TS_EGR_LAT	0x6c	/* MAC internal Egress Latency */

do not exist on earlier versions of the IP core.

I wonder what values are there?

Thanks,
Richard
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
