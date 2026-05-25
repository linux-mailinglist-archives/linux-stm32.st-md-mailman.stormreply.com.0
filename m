Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEgmONMuFGqUKgcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 13:13:23 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0795C9C91
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 13:13:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97208C5A4C4;
	Mon, 25 May 2026 11:13:22 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 175E8C5A4C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 11:13:20 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64P7Y5v41630363
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 25 May 2026 11:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=lCcY67VRp26KG8gUmXkaFmQN
 V0bN6FhsAAQbVvffwoE=; b=N2yHIfNDPCAoU0qJJ2fS+P/o1mscfVDZ+owL1O4v
 Y+7ouHnArUgFXSk2rhBHYgWlhK03pGP5KcHUcXpPMw7E+aasiyFr89PIYkRjWBcC
 uKjqRp9CjY8ofZFd0/+8BsdFrcvQo0avU50tH1CuxzGhBm4qcyxd870uHVu95xCa
 XtQl3Gqc3H1ePAJ+WFqfXkBbtY/biq2K1NwCPdoscGDceFTjyKyP/w5StkiyogYc
 LbgiVCB5SgFcAQFhBtiv5aLMEk3nOoaQlqY7tcnLPorgW3fc78PnAknMcLQLm8Wa
 s9s02nwk+R8Fv9ac+UcsZ+kGO6g7THNY+WjkTGG2Fg3E6Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w5uyt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 11:13:19 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-956732444ffso16682355241.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 04:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779707598; x=1780312398;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lCcY67VRp26KG8gUmXkaFmQNV0bN6FhsAAQbVvffwoE=;
 b=VjacF7bXnea2apden4Vie85jGnVcNBP52CYRZ2rDXroqwveMN6ccP5jvqUb76FV/5L
 aF8cX9UDcMRWZwinwDEW2e5shJzkt5m8AUuREiEklKkKwnZ4sH5y9ElWPFJ2h6v6DI7i
 IGatWAtylY1QDy5RPBnM0BF6h0H0pLRqst0orJshQZcJ8jdNMy0XHAjxlfNvbjq3ZPYf
 vIhVhwQOx34f8Zz358xzSDZqxR8IXTTV9YHdLoIFBt0+l3fEjAeHr0Rh2slubMkHmnKT
 Lrf4UMvfPxjRXjVSPcUOZiY2v49XPMvdiBxjaFt96chE/DGglGjXcKvRtXz2PC8W/+uP
 CzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779707598; x=1780312398;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lCcY67VRp26KG8gUmXkaFmQNV0bN6FhsAAQbVvffwoE=;
 b=TLVAOdRSPvZaeqmcwUiQTXdtNuIZMmTqnhHepVCl/EoEz+EoWFX+ekUL08psUpFJoy
 AWEbeRj8ZclSINeAvR0eRxQIq6WYhWMpUC3aAx2PrZtpWvHivGFI8r0QZ+OYgg3NOnWj
 GuUMt0mmqpmyOfv+51Nyr+tbFufH/cUN0jyoljpUzzDkE1FrmzOfuFOm2EBj0KVOakHg
 dBhOLzuPOh037ZzrDWh51AxPlatLxqtRMkz4S+fu9k2yQQF/57weD/VdHyNkmmodYXOA
 F0k2DDx8z2xdLki223hJ1D2yNKbIRlNjphYoMF80CdHCsXdBtc0Eofi2m2bcKUzrNquX
 ibWA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+RuUPYN1Sf7v15tRP+ncXdWWrErYf1Ph9G4k/r5XEVMuk+ifXFDme9WkKUs9J3sk5oQshNtUULaWk8Cw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzjE+H0QYSAIq3JyNht35DkyeTNpl31nUrjaKHluvL9R7ekJD4R
 p4iAEpQvMBWtE9YQ8rSHdF8X6rpG91cOnn7OWx+KZWCktORysDQft315QM7H0CMDeC0D6QM+aDf
 emi6qunWoZDcaKr2/esTXmNQ8ncgsw8MQEh/gKe2UoG8TShyz8qQ5n5zGPuf57H8cQb9zp70Te4
 bzwA2ZA4I=
X-Gm-Gg: Acq92OFCJVu9DnBluv5v7gFOADIhpUh2URRBOtj4fHLjZVtS3xFj04hH/zog6rwS8kb
 LUgrGuBlT6yBf5Fhe0UTWI/tfxuM+4rai4N6WHcCjRzGyEY+baGlvHKipiIk/t64jA6oHFpQ/XI
 s422M1L26C5LI0i6eGm5hXMUwrzLVo19tTGHkIiaBr+2+C3zVzh1YndtWj+8tI5EooRYzCX8vXO
 iJZCUM5dNcXurvI3RaSJsymhr+187tlmht4ZtIePFkkC6kpBvu39f6QDAhRt+JitoV9aEyRFaWZ
 kE+mc+iSs6lfwMquy5AS8tUv5AWdbcA7hMx4NADhkW99N0NOKLuZ0l+CihLkRot0RHqVuSfC6Bs
 384aU0JXZanhaw6hYvCrvcd9iNKFteOVketkhifIiidWhYaEjnAUe9lW2lFLqWzhLeraybVQ+5M
 Ab5TbdmHa/ljf4TiyVPDkVIiIT/dR/sM3NJ+8=
X-Received: by 2002:a05:6102:688f:b0:631:81d6:e158 with SMTP id
 ada2fe7eead31-67c8fcbdbdfmr6786142137.27.1779707598218; 
 Mon, 25 May 2026 04:13:18 -0700 (PDT)
X-Received: by 2002:a05:6102:688f:b0:631:81d6:e158 with SMTP id
 ada2fe7eead31-67c8fcbdbdfmr6786125137.27.1779707597811; 
 Mon, 25 May 2026 04:13:17 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5aa32cf2ed7sm2648170e87.68.2026.05.25.04.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 04:13:16 -0700 (PDT)
Date: Mon, 25 May 2026 14:13:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Message-ID: <27l6r6gp6zpddgkxne7jasjxamy4dmdkwg3xyp6hrmdbtk7mxj@jxsgeq4yvfhh>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a142ecf cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iCjoXWfrZ2YzCb4Nau0A:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExNSBTYWx0ZWRfXzaNbsOWJEyPR
 jAH6IRiviDhuQwrblVRSqc17WFV+1dVZDy1ZCIZE1v1bI5/hMiyQkaV/14qYLpRWMTeVZWmoPR6
 tA9rPWfOzD9tDZTqaksIR0vOtGEosMIx6PLk5p1lKozltCEb8PMoLHAVPVpiO36BeiVG3ymlfHs
 I7IgCy6DaA5OLrLJpYcJPpU8w9o66oWJlCobDSuETGqVVbuygDHReNdUuDelVUGYGugZGYqxquX
 F2wozLcmvMHjLtbqaMKb/Kt60ROY1bOcIBX7oVUrtHj5rkdYZoRC4qfGgzhWwFY0p4hasbo0QZn
 CUpdjnmhDy64qIwS9mlTWyTndFqz8221YHean2AXrVTiNaWJ77jlq6HO8a+Q89h/LEG9BMLUBQz
 wKCk3GLX0DvXOsY0S0M1bjZk/iD+pD4MR6OXzBhbkZk1+lhyM9pQKyZSplGnUbUbGY0mhOTp2Jo
 AUYokSiMPees6R6zYZw==
X-Proofpoint-ORIG-GUID: ZL6VijTEl8CXOZ42PoaeCHj8Eeo8ALfv
X-Proofpoint-GUID: ZL6VijTEl8CXOZ42PoaeCHj8Eeo8ALfv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250115
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org,
 Luca Weiss <luca.weiss@fairphone.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 0/7] Add support for Video, Camera,
 Graphics clock controllers on Eliza
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
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:sboyd@kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:linux-clk@vger.kernel.org,m:luca.weiss@fairphone.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jagadeesh.kona@oss.qualcomm.com,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:konradybcio@kernel.org,m:mturquette@baylibre.com,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	NEURAL_HAM(-0.00)[-0.817];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,oss.qualcomm.com,vger.kernel.org,fairphone.com,st-md-mailman.stormreply.com,gmail.com,baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 7D0795C9C91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 04:16:02PM +0530, Taniya Das wrote:
> Add driver for Eliza SoC camera, graphics and Video clock controllers.
> The camera clock controller supports the cambist clock controller and
> the regular camera clock controller.
> 
> Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
> and MXC rails dependency. Since CX and MX rails are already ON when APPS
> is active, explicit power-domain voting is not required similar to Milos.
> Hence extended the Milos camcc & videocc documentation bindings for Eliza.
> 
> The patches have been tested on Qualcomm Eliza MTP board.
> 
> Changes in v5:
> - Taken care of comments from v3, v4.

Which comments? Please be more specific in changelogics.

> - Update milos-videocc and milos-camcc bindings to add '#power-domain-cells'
>   as required property in bindings.
> - Remove duplicate clock 'gpu_cc_gpu_smmu_vote_clk' from driver and
>   bindings.
> - Add '#power-domain-cells' for 'camcc' and 'cambistmclkcc' device node.
> - Link to v4: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com
> 
> Changes in v4:
> - Update the clock ordering for camcc and cambistmclkcc in milos.dtsi.
> - Link to v3: https://lore.kernel.org/r/20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com
> 
> Changes in v3:
> - Dropped new documentation bindings & extended Milos documentation bindings for Eliza videocc & camcc.
> - Dropped the defconfig patch and included the drivers as m from Kconfig itself.
> - Update the header inclusion in the milos.dtsi.
> - Link to v2: https://lore.kernel.org/r/20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com
> 
> Changes in v2:
>  - rebased the patches on the latest linux-next.
>  - Add new bindings for Video and Camcc.
>  - Remove commented code in GPUCC (limiter code).
>  - Add device nodes for the corresponding clock controllers.
>  - Add RB-by tags for VideoCC and CamCC/Cambistmclk from v1.
>  - Link to v1: https://lore.kernel.org/r/20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
> Taniya Das (7):
>       dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
>       dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
>       dt-bindings: clock: qcom: Add support for CAMCC for Eliza
>       clk: qcom: videocc: Add video clock controller driver for Eliza
>       clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
>       clk: qcom: camcc: Add support for camera clock controller for Eliza
>       arm64: dts: qcom: eliza: Add support for MM clock controllers
> 
>  .../bindings/clock/qcom,milos-camcc.yaml           |   12 +-
>  .../bindings/clock/qcom,milos-videocc.yaml         |   10 +-
>  .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
>  arch/arm64/boot/dts/qcom/eliza.dtsi                |   61 +
>  drivers/clk/qcom/Kconfig                           |   31 +
>  drivers/clk/qcom/Makefile                          |    3 +
>  drivers/clk/qcom/cambistmclkcc-eliza.c             |  465 ++++
>  drivers/clk/qcom/camcc-eliza.c                     | 2803 ++++++++++++++++++++
>  drivers/clk/qcom/gpucc-eliza.c                     |  607 +++++
>  drivers/clk/qcom/videocc-eliza.c                   |  404 +++
>  .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
>  include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
>  include/dt-bindings/clock/qcom,eliza-gpucc.h       |   51 +
>  include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
>  14 files changed, 4666 insertions(+), 4 deletions(-)
> ---
> base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
> change-id: 20260409-eliza_mm_cc_v2-701c34ddb74e
> 
> Best regards,
> -- 
> Taniya Das <taniya.das@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
