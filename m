Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOoUOU+hwWmFUAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 21:23:43 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B58A2FD27C
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 21:23:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D358C87EC8;
	Mon, 23 Mar 2026 20:23:43 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A639FC87EC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2026 20:23:41 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62NHqixS3171141
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 23 Mar 2026 20:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=olrg9+koKbp1wST4wwsyJvh2
 +Fhta++w8bB0JufkCNc=; b=hrwgHYkt1QFkdKuInaLwrkqFZ8cI3EhkOa53XLsD
 cbxrVjDJmZuW8PBe/zJ6hrCed2qH69LJeBNHdo9Q4QM3Nk0vUsnuK4T6/TEOXcEc
 t4h0TBFfOpYZFCzY8QtbYw+hyZ83aoPhB/RenJdJMo3cNayobtYjLa+fbbL6/Sio
 eAQwLkwYt09VoWUbb5LKI2OjES+lYfzalxhWGZxt8e0S6Op41Ut1YIGxlIuoLxL4
 7do+kdJn+/hTsV5vUryxB0tQ4DO7asIvpx1aFugKM6JPcSVkhoxsOjxAi1p9fsS8
 PXADvEucj7538b5FkLQpgU4u62f8QNlt707hQHifB4glzg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r21kxw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2026 20:23:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-358f058973fso918596a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2026 13:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1774297419; x=1774902219;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=olrg9+koKbp1wST4wwsyJvh2+Fhta++w8bB0JufkCNc=;
 b=Tt+9l+WdQvxwH6qn+oGR8eeV4n1jHFkcb3f2g/tIjDuRfzGmCh5xxvQzW0ZmaWoCnq
 SNG2Mpwoe5p+VaaQIU1zWg7Z+kzBOtBFHFq05JGB4OLAk+VRSUi9onzoq2z2/ZfFhuRW
 DASXCaM+OawniW8ROW3H2uqn5456Af+cLPb6LKwu7sijGjN7HwJSDxDcayOiJUPSsNg7
 +I0ae9NB60TV8rk/EGTEIHr+/x3PgdtX2FM+67xbOR6ay/0qsuyFHQyA2qic+S07fb6b
 Vs8cJEIz86fSIqrD4KzB89yuZN3lPkmdYOSj9N6IctY+vrBykkuGQzVpFZfu28r77kpU
 cvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774297419; x=1774902219;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=olrg9+koKbp1wST4wwsyJvh2+Fhta++w8bB0JufkCNc=;
 b=HQcNh/rNbc41we0vepvDTQFFu90NC9NRqgjxdIjIZhPCjnM0BLvAuxBX+xUR0JZoR6
 BFCeOD4lDSsE5H1wKG3VGxRNW7C3gI8eelz6xsblnrkYCWrO0SI0tMQti7zWxOj4yJr4
 ZemqDDdze2E5oqTJ7psOABYrcAp7i3FhgSnvEjMbJOqtbrwnmvRVB+F2D6eaH5ygwdVP
 I9yx00gLLpxZEE6uqrBWlaOo88yuwa5Gv83e4XlyvK0UUCnJT8umYp8EcQoYxAR/Wa5g
 VpxViBAJVJHY2f8rtJA+KWwgIPc59FUiM8CbIBhmYMkpSAdhytD12BI9gFux3of1TbHA
 cPlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgKelv/UXKWz8qCP6lcDCBILDqCFqx6C8U/K9B71c3sB7GiKkZUNI6DFRCN0af4J/fPFmPs72z2jI7yw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyxNNK4H9/byRanM9QvQOewxlhWZeyZSiFZlhoJUES3u+Q3xFKA
 i064/Ka4LNf3Dv1AV2BiZ7O5xNvwDqYc5BtNq1l5yxaKAuVOr6VsNXUgCxWcQ2eXDBMEJIjienP
 gm3AUVIzd0JUm4x21aPXzy5UdX/Y3voqqc6lmkXXOZ1gWh0e1Wy7vkpB/gevg6Te+kaPWY1tBvf
 hsHgPEbcc=
X-Gm-Gg: ATEYQzyVcIH8C2LakFlEwuyNKyR26vhNlI7j700yRF3SSyvf8nnXBJBv9YKH5KQtz/I
 NAraJphcONSH778cr53EBKowx5ZbKssCCjUXxTVOSE3T7B/2ck1yGYYWK8bawXEUIekbjAJk0Oi
 VgmrjbcRyVYFeG4Yr5rJa0qJR4hKfsCdSOvPblipL7rC4960e0K7FEKDD9NOkE/am3CRhR2uWFp
 5QWqkfcf315DbUq4nFIiPDObaLPRFbT6NHedocDrZ4YeA8BPZvvCdErpU1A5A0rQ11VpfE8rpml
 NfswFbwOafIpuqVbEWSbAEkfDTvvX0lp4fK1nL7hoLnAb4OfiPFskXuqpanYmQO8TGOWU8qgcbc
 Lggz5Fcd/Parr34ykdgX7d2rplcKiyYdu4xQ=
X-Received: by 2002:a17:90b:35d0:b0:34c:fe7e:84fe with SMTP id
 98e67ed59e1d1-35bd2d0dabcmr12741288a91.28.1774297419025; 
 Mon, 23 Mar 2026 13:23:39 -0700 (PDT)
X-Received: by 2002:a17:90b:35d0:b0:34c:fe7e:84fe with SMTP id
 98e67ed59e1d1-35bd2d0dabcmr12741263a91.28.1774297418454; 
 Mon, 23 Mar 2026 13:23:38 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35c015cd6c3sm78727a91.0.2026.03.23.13.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 13:23:38 -0700 (PDT)
Date: Tue, 24 Mar 2026 01:53:31 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <acGhQ0oui+dVRdLY@oss.qualcomm.com>
References: <abdEscs44fU4kRag@oss.qualcomm.com>
 <abdYu864OmNWiWIW@shell.armlinux.org.uk>
 <ablpxwGks9m38fhM@shell.armlinux.org.uk>
 <absjNQ2s3Z5N2Zwo@oss.qualcomm.com>
 <abtE7sDT75I7uPnk@shell.armlinux.org.uk>
 <abvAuHFZzCFobO-V@shell.armlinux.org.uk>
 <7566c66b-2dda-4b29-b59e-4e4a7e159e21@oss.qualcomm.com>
 <abvy6nZyjyxUXMuf@shell.armlinux.org.uk>
 <bcab38a5-e7f7-47c9-ab9c-99294e095c22@oss.qualcomm.com>
 <abwSHGw39FTJGNb7@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abwSHGw39FTJGNb7@shell.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c1a14c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=G4x0Uraz-9_3_ZZlgMgA:9 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: ceoMhvkQ77sGxrKyPrCbv5-Z979ctVcB
X-Proofpoint-ORIG-GUID: ceoMhvkQ77sGxrKyPrCbv5-Z979ctVcB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE1MSBTYWx0ZWRfXyuhGyEGQ+6v/
 OvPWQBaFBn+4tFWbpYJMWv+2Bf2SjiUGkvHI+fneozv80aIF1Q53dPousVDgiqufJF4aeb7vn7p
 wUkTVY4nc1/AFepzUWQ5EOdjd8d3IMnbaEOXrcGBCmvlC0CMUYYUko8C0xnbpi3OYTb5mU5RL0K
 qdnRRZqsnn/cBQncoGim5ddzVQpbsq0xAQorQK7R/VLY7WYGK5mM+Ko33nYwqqmVjC+GoRdd9bJ
 +e04wd4UjH7YQ8rDO5KlgioHvFq8G04Z9gKahmkxHN5znqA/KS9eekrJa96g0hpg86fV9KB/h/+
 CGeAdaKkjB3cSQt8kc9TMO4w+UlXQW2vzS5KJYY3iDR4IrMoN1NatKdBjLt6AQEzWfPOCfVXkjV
 pK8GKrWg3dmq9DP8s669+FrlCx5AQISSJTtIHwQ9poD5gGDW0nHe+aXoc8bRgWjRUQ9bQyk6gue
 jUDj0qMxyt/o/Kj65yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230151
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Andrew Lunn <andrew@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/8] net: stmmac: improve PCS
	support
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:konrad.dybcio@oss.qualcomm.com,m:andrew@lunn.ch,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[1.95.144.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 7B58A2FD27C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,
On Thu, Mar 19, 2026 at 03:11:24PM +0000, Russell King (Oracle) wrote:
> On Thu, Mar 19, 2026 at 02:50:29PM +0100, Konrad Dybcio wrote:
> > On 3/19/26 1:58 PM, Russell King (Oracle) wrote:
> > > On Thu, Mar 19, 2026 at 11:09:33AM +0100, Konrad Dybcio wrote:
> > >> On 3/19/26 10:24 AM, Russell King (Oracle) wrote:
> > >>> On Thu, Mar 19, 2026 at 12:35:58AM +0000, Russell King (Oracle) wrote:
> > >>>> On Thu, Mar 19, 2026 at 03:42:05AM +0530, Mohd Ayaan Anwar wrote:
> > >>>>> [    8.650486] qcom-ethqos 23040000.ethernet: clk_csr value out of range (0xffffff00 exceeds mask 0x00000f00), truncating
> > >>>>
> > >>>> Please look into this first - with the MDIO bus operating at
> > >>>> who-knows-what frequency, this could make reading from the PHY
> > >>>> unreliable.
> > >>>
> > >>> My guess is clk_get_rate(priv->plat->stmmac_clk) is returning zero,
> > >>> which means we don't know the rate of the CSR clock.
> > >>>
> > >>> From what I can see in drivers/clk/qcom/gcc-qcs404.c and
> > >>> drivers/clk/qcom/gcc-sdx55.c, this looks like this case - the
> > >>> struct clk_branch makes no mention of any clock rate, nor does it
> > >>> have any parent. From what I can see, neither of these drivers
> > >>> specify any rates for any of their clocks, which likely means that
> > >>> clk_get_rate() will be zero for all of them.
> > >>>
> > >>> Sadly, when I designed the clk API, I didn't think that people would
> > >>> be stupid enough not to implement the API properly, more fool me.
> > >>>
> > >>> Under the old code, we would've used STMMAC_CSR_20_35M, which means
> > >>> we're assuming that the CSR clock is between 20 and 35MHz, even
> > >>> though the value is zero. Is that the case? If it's higher than
> > >>> 35MHz, then you've been operating the MDIO bus out of IEEE 802.3
> > >>> specification, which can make PHY access unrealible.
> > >>>
> > >>> In any case, please fix your clock drivers.
> > >>
> > >> I'm not 100% sure the currently-passed AXI clock is what we want
> > >> there and the docs aren't super helpful.. is there a synopsys-name
> > >> for it? What rates would you expect it to run at?
> > > 
> > > There is no easy answer to that - it depends on the bus interfaces
> > > and whether the CSR (register) clock is separate.
> > > 
> > > The likely possible names are hclk_i (for AHB master), aclk_i (for
> > > AXI master), or clk_csr_i.
> > > 
> > > It does state that the CSR clock should have a minimum frequency of
> > > 25MHz to allow all statistics to be properly collected.
> > > 
> > > The rate of the CSR clock needs to be known, as selecting the divider
> > > for generating MDC within IEEE 802.3 specifications is rather
> > > fundamental. You may find something there which hints at what rate
> > > the dwmac's CSR clock runs at.
> > 
> > If it's either AXI or AHB, in both cases their direct parent is controlled
> > by an entity external to Linux and their rates may change at runtime,
> > based on aggregated needs of the bus. They're defined as levels/corners
> > (abstract term for a hidden volt+freq combo).
> > 
> > It may be that the operating range for the EMAC removes that variability,
> > but with no concrete evidence and just anecdotal experience, that's only
> > the case for the AHB clock
> 
> The important thing is that the MDC doesn't exceed the max clock
> frequency for the PHY and any other device connected to the MDIO
> bus. IEEE 802.3 specifies a max frequency of 2.5MHz (minimum period
> for MDC shall be 400 ns). Some PHYs can operate in excess of this,
> but one would need to confirm that all devices on the MDIO bus
> supports higher frequencies before using them. In the kernel, we
> generally err on the side of caution and stick to IEEE 802.3.
> 
> There are two ways to achieve the divider value with stmmac.
> 
> 1. if priv->plat->csr_clk is set to a value other than -1, this
>    configures the hardware divisor (for "normal" cores, it takes
>    STMMAC_CSR_* constants that can be found in include/linux/stmmac.h)
> 
> 2. otherwise, the rate of priv->plat->stmmac_clk is used as the CSR
>    clock value, which is the reference clock for the divider that
>    generates the MDC clock, and an appropriate divider is selected.
>    Given the available dividers, it works out at between 1.25MHz for
>    a CSR clock of just over 20MHz and 2.47MHz for 800MHz. (I have a
>    patch which documents the ranges for each of the STMMAC_CSR_xxx
>    values.)
> 
> Note that the dividier constants are not the actual divider itself,
> as can be seen in include/linux/stmmac.h
> 

As noted by Konrad, the AXI and AHB clock rates are indeed unknown to
the Linux kernel:
[    7.739389] [DBG] priv->plat->stmmac_clk rate = 0
[    7.739391] [DBG] priv->plat->pclk rate = 0

Additionally, here's what I found (focusing on QCS9100 Ride R3, but
most of this should be applicable to all qcom-ethqos consumers):

1. clk_csr_i is connected to the SLV_AHB clock, named "pclk" in the
   devicetree. This is the source for the MDC. The "stmmaceth" clock,
   provided by AXI, is used for data transfers. It appears that the
   devicetree gets it in reverse as per the stmmac clock
   documentation added by Russell, i.e., the right order would be:

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 147ebf9b1ac6..f1aa2490bf6b 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -7111,10 +7111,10 @@ ethernet0: ethernet@23040000 {
                        interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
                                     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
                        interrupt-names = "macirq", "sfty";
 
-                       clocks = <&gcc GCC_EMAC0_AXI_CLK>,
-                                <&gcc GCC_EMAC0_SLV_AHB_CLK>,
+                       clocks = <&gcc GCC_EMAC0_SLV_AHB_CLK>,
+                                <&gcc GCC_EMAC0_AXI_CLK>,
                                 <&gcc GCC_EMAC0_PTP_CLK>,
                                 <&gcc GCC_EMAC0_PHY_AUX_CLK>;
                        clock-names = "stmmaceth",
                                      "pclk",

2. However, even with the correct naming, clk_get_rate() would return
   0 for both clocks since they are firmware-managed.

3. For GCC_EMAC0_SLV_AHB_CLK, the hardware documentation mentions the
   range of 50 - 100 MHz. I am trying to check if there's any chance
   of it turboing to a higher rate. For now, I think we can assume
   this to be the working range.

In view of this, would setting priv->plat->clk_csr to
STMMAC_CSR_60_100M from the glue layer be correct?

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
