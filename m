Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOvfGJI1zGmXRQYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2026 22:58:58 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 015EF3714E2
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2026 22:58:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1060C8F287;
	Tue, 31 Mar 2026 20:58:57 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A2A5C8F284
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 20:58:55 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62VGdgbQ3926843
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 31 Mar 2026 20:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=HddPcSAbUNS8veYlTx2o5Se9
 1feKqDMffrj4xcj/ilE=; b=nfMp43OvPKg9eH1vcdrAPIcAYlhRnyjwneuIP46G
 95nmc/u5yohrbiDrFUCHs6ZXEnG5EYXm/spSAwdxyXOkNvaHJ99r/HtY+iZHzEn/
 3fKvEOb+JWTFsKJpS92+tez1J2hGKS2ej7F00zGeKqCtTHM+7bnyz20x4k/2EgyJ
 EIrLrDC1ONnIwrzo1Q7H/ljKWZjcN0DIDydUF3RvLlpn/fi240m/I+QVmzv0Tgvz
 mjndNVO19zI2XiJVyfemN9TiyOeibZfO6gxfohI0Dn2eRQb61gfZ6hVcBmULUZ/S
 SqLtMmQMPufxo/jv5e5PRFf1Wjl/+1Oy5FYxWBOrXavc8w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b9339rn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 20:58:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-82ce0a9e558so677109b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2026 13:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1774990733; x=1775595533;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HddPcSAbUNS8veYlTx2o5Se91feKqDMffrj4xcj/ilE=;
 b=TIuu5mH1LeBjstHt1vCiNr0lEkmlJaZelho2YNk8pNxisxIwjUYQHXSKMlN82o2XPp
 QB7sANShGKxdXXlIzeoI5GmDXXRLEYmgjJZ1t7f4Z4IATZ6yIJZzpXZ9IeKjQ8MesKNX
 fA0cbJzGzv0wBnjt5RvfIGMT4k2upwJzQbq2MUYb2bcE2mihJGoPl4cnFeCtJ2JttT9u
 MOc9FNRFSHwqW2STh4C27Ep//UTyJnIVRKdrwR6+YnYEAChjbkypkaTFDE4iltXJsbYY
 5Drl28ZwLcExikeO34Ob1mrmJriTMWjr2ZSDMFBsuN5uBWS8TkaadQAtdoztXn4+FqvE
 ks9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774990733; x=1775595533;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HddPcSAbUNS8veYlTx2o5Se91feKqDMffrj4xcj/ilE=;
 b=YBTQIJDcYbzeL1zspqkEzgDhCPb46U/ZFF4zTFB7gyCzzKefEI/+9Y+b1ewSkQh21/
 CDED/YnrHkYzaPRJwKgqUQM3LMFqKqASVkAi7fYnRBVQkcEjmMUE4UhuVEgJezZcFMdj
 18dcA+QOOPyQtAaYxI80vzGAPcGyUSyIY/NON2LEpZwhuVKKR2Nskib+evjQENGavMaD
 V7vfvosbBLaFBiewN0gft/kdUNBO99YsZQkWB462UsnzKFS2tyLTecZdUmzkOPPBjtCH
 hDAQ9qEa6UpgfVbbLW1y4mnI4To8s/RG4hXU+UyNxy8LKFg3fyBSZ8t/Ll//H7mdtVxJ
 c5EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5f4sb0xmYBzFIPHsm5MGN9QA+3cKeO4o4AKVghREPwWL8o3XFFqk2WFuC/Xu1hc4oArz5r+FLqOeOrg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyqYVZKSlpTSotSnHqi4d8l8gffhnh8yEgs0MQIb/n6i8VcpfUE
 G1tgFb4pMI7HFtnQyTgRxfoGEtFyof0PENDURk0HdMxa0qfBqixg+wyxcvh5BHq9eQJBA77RGzm
 QOm2ACuv4VGdl/y35gB3/UzETbOh3ooOWofsH5olImsmKkdaow1GI1JEIJpZIy5HP6R/mt49Rpe
 wibO0a3iA=
X-Gm-Gg: ATEYQzx/zcenk91LD0zq2mBjAs/IrtolAdMEzI6BgKO5Qc5TO3AoxbsatPVVgp0t+LD
 Pf3Ii9GdvS4DvCMh7BZ7rlHsCascjo87arogKw9RXjfUgGVeXkJLd+bxxbDapEWyhhp4seQXXMu
 /l5YTPBptOcCaVpYY+RXpYlHXEMIvwF9eWM/fdoKYfKhO1d1emGNY8DcxNMTvnPr/I6pVnsxINt
 qNOdi7eXiLn5kTBtOJ+9Nd8onUAy6d/QWNXGt+BHLkvCEly7NJWf78KTaJ7f65hwGNNyJFqCPWD
 74LaWSlJTtXLiey6bgX9CoJU/q7AcWZKJ66LCpAX/EtKwW5Hs081XUv4thIv6NOd4RvAMUL+Xk6
 PfcoKIhZwGcuYb/EX2sqfXB7iYJYgsO1t2Bo=
X-Received: by 2002:a05:6a00:84d:b0:82a:60ad:874 with SMTP id
 d2e1a72fcca58-82ce8957d6dmr1039527b3a.19.1774990733393; 
 Tue, 31 Mar 2026 13:58:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:84d:b0:82a:60ad:874 with SMTP id
 d2e1a72fcca58-82ce8957d6dmr1039494b3a.19.1774990732800; 
 Tue, 31 Mar 2026 13:58:52 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82caf97abfesm10359545b3a.1.2026.03.31.13.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2026 13:58:52 -0700 (PDT)
Date: Wed, 1 Apr 2026 02:28:45 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <acw1habUsiSqlrky@oss.qualcomm.com>
References: <E1w6AZm-0000000E54W-1F6E@rmk-PC.armlinux.org.uk>
 <9d0a529a-d065-4f46-a93b-23195a4f9727@oss.qualcomm.com>
 <acpqgpCsbo3lJs3l@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <acpqgpCsbo3lJs3l@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDIwMiBTYWx0ZWRfX4Ve/v/r0YOFL
 5qGB6RT9t7GBvaKZJGzwbr/Zw/fTa87csiaU55PKAhKSrLsVEs1tayb9pBRiRhZFb3I4K8BVw+i
 JqylQp/cqWxEs+3GWKCgMbVK682A3eFouuuOMM9WkW6J+RbsgaAY1sZm23tGzfmknvkKVStmSbW
 06WhIFgv2sFF8qJulSBIO526cxZVWf4z3T1SXuvGXHE1XqaKDNIjP4FtQgdwFokOW1BkCBlW/c2
 aP6tMpnOuyDxfOBDhaFvnS0NAsZY7z5O+x2XD1eydV8Vf3CVKQiPiqCGX04tQOUfZzMBL3eNz8w
 5ftVeKGV+Iz3Q/aSEXWEcM+5kyDVJEooeAhPE9oJG5bgadXO1yRrJ3HW1ZhlBEUuBVwmIMKMFfA
 UIZng3snOqzOXWO6GcrD634aGsDa31w8a2Qdha8LoanJDE405uwrDXUF8arMfPmE9aLKRAP8hBC
 llHcLxFEh2HXyx1gI6A==
X-Proofpoint-ORIG-GUID: sZ4X3E6r8ZLVjTCWTWE6g5JqI3yaUcrO
X-Proofpoint-GUID: sZ4X3E6r8ZLVjTCWTWE6g5JqI3yaUcrO
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cc358e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=9WimFISaW_B1XMulNl8A:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_05,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310202
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Andrew Lunn <andrew@lunn.ch>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next] net: stmmac: qcom-ethqos:
	set clk_csr
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
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:konrad.dybcio@oss.qualcomm.com,m:andrew@lunn.ch,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,stormreply.com:email,stormreply.com:url,qualcomm.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 015EF3714E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 01:20:18PM +0100, Russell King (Oracle) wrote:
> On Mon, Mar 30, 2026 at 01:18:56PM +0200, Konrad Dybcio wrote:
> > On 3/27/26 6:02 PM, Russell King (Oracle) wrote:
> > > The clocks for qcom-ethqos return a rate of zero as firmware manages
> > > their rate. According to hardware documentation, the clock which is
> > > fed to the slave AHB interface can crange between 50 and 100MHz.
> > 
> > FWIW this __may__ possibly differ between platforms, but I'm not sure
> > to what degree. Will there be visible impact if we e.g. have a 200 or
> > 300 MHz clock somewhere?
> 

While I had made an identical change while retesting the PCS series,
I was holding off on posting this patch for the same concern - what
if some boards fall outside the 50 - 100 MHz range.

After some digging, the AHB clock appears to operate within:
 - 50 to 100 MHz for lemans/monaco derivative boards (2500BASE-X
   interface)
 - 30 to 75 MHz for boards with an RGMII interface.

This is not exhaustive, but it covers all boards I have access to
which actually boot with the upstream kernel.

Therefore, I think using the /42 divisor should be fine as it will
ensure that MDC never goes beyond 2.5 MHz.

If a future platform exceeds this range, we could switch to something
like: plat_dat->clk_csr = data->clk_csr, with each EMAC version
selecting the appropriate divisor.

Due to some urgent work tasks, I am still finishing PCS series
testing. I will provide a t-b once done.

In the meanwhile, please feel free to add:

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
