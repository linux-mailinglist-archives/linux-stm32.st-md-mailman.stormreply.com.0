Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNeDGu8vfmlfWQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 31 Jan 2026 17:38:07 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC18C30AB
	for <lists+linux-stm32@lfdr.de>; Sat, 31 Jan 2026 17:38:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EF21C0693F;
	Sat, 31 Jan 2026 16:38:06 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1BB2CFAC40
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 Jan 2026 16:38:04 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60VEs2DF1106904
 for <linux-stm32@st-md-mailman.stormreply.com>; Sat, 31 Jan 2026 16:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=J50vAf4p6pBlGcfz7i0jIrGJ
 w+GAmstYwfRJL62C4qc=; b=g4++Jq9iWAPk3s6pcZPMglEaYIh5vVQ17pyXSuVJ
 nMytMkfzHNqJZFXZBl02yusZX//QuRM/j9X3gRWf0TL8etmKhWqVloCjgeXj1R82
 /Im9SfNapYLWXeS6zCo8kmW7SBNuJiovBMo/mCaN7MceJ+ciko9CudXzPez6t0Kw
 5Uoo1nVp+PUG2fu6YT4BFSOlhxn/ptIZ3mFfwlTiw3hcMsg5LPQ01dni4s4boNu/
 dZLmR18JlOu7X0kBs2D/FdFpXX/kvnFMpURN2E6QtC9wmnUdrYRuaZZZHiuRwvRD
 V842pUfJUr06E7OLLCsVTBHO9FMvJ5tisfW7M5vjswmAzg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avx14ad-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 Jan 2026 16:38:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-c551e6fe4b4so1964316a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 Jan 2026 08:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769877482; x=1770482282;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=J50vAf4p6pBlGcfz7i0jIrGJw+GAmstYwfRJL62C4qc=;
 b=Cz6u0/dc+yPpScLu3P1SCOBwMIPT3bNSOLBYq7CfMLMuMS9uRLNioq6C93CNv9bv3A
 E+i7ReMUci1R2oH2S+K6MnANyszNALEJcqcRbeHmGOzCg1PEgbGvSkISO2GbFYQyowpP
 nk0LB8klgGaOrNTW1kwm32ZVcfqHrQPcKduzmMhEojk30dx539fExzH22DQigXMfFJ+I
 QO3KKx8nKfz92Cmn99J9niGZofKuVX5/o2F0GS40nAlkPnrh5E2A0/lpiuAMgANakK1G
 YGlVMawAdXAoSgfGp3b/w+E0sz9CgrjxNRxqXZzy24mw5Elzbe1+KRPuWmRCnLVjPBjb
 y5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769877482; x=1770482282;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J50vAf4p6pBlGcfz7i0jIrGJw+GAmstYwfRJL62C4qc=;
 b=NYh4j5MCdWcnRn9rkaALUujxsBi0tUmfywSouZFXitADSkMxgvFEjYCYrb1DISjeC7
 lrcFrykelBvk7EFTOCuIRCmtF83bBGfcL9tcBPRP8RLwrDjkW/6x8e0EIsLT6U9vwIcs
 toC/Sv/MUW94cnjxQ3Z41StcfSMCfrzAavLNxyQGLcff+ei/INJo9IoeRLpr0OZjs7Jh
 N5tlIDtQc/b2z9DUnUEARiUrG1ubt8TQA9DO2XIdk3mZ7PKdnJcPy/pGAXl2cEz6WVbE
 j8CltkBQtHyhRJ1ZJ0mKX0mxwvU/BpX9pj4QpQz37Rads0ocLuuw/pvlAfhA0y0rahab
 vk4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwnHpNjCiqZBbZldJSFL09f/HXEjPVPHwT8qRlMGctjJrD9fLqcQV4k0zch+zoh5G+zTUzVIMl2baqbw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxvG86U44q/ozdog1an5281MKQ6VuRm4WPzgfrLlY+xAuDOZxIs
 hGUWPM6/ntnornu6hC6lWhsqE5oHWY/gDtdspsSyDi9XtVhym9Tic8S2UEbC+xgj+wli1FDDRsp
 GveyHwxIhU5J0S2c1h6zsXuq9jhKIa+u74hcQLBnVWZghQ0ekQvqWm1rf5Q37dizEP99vgFrQ+9
 cKdfiEPCQ=
X-Gm-Gg: AZuq6aI3VihcDSSVPQ0pLrVLUR/67NOSIs/KLfXUGtLXcZA4Rbi/Fy7o/p2L6lyOhIy
 MFVfH6aVPJOc16WY3lR8SE6H66s/3f/WyNAd/0dzb/E0R4cvmNuR9FVFbojcdqDd3tpKAnA6KMN
 AOuICSGgVaAEDbSg82QDRarZ8aP5J468ysKEp7/UEoOe4xjnJCJIdU5Nhy63PAb3CRMZHojkWWM
 oGN7ONMf8QRSZOlb89vx4ys5pR+DFQ1qAXNRiB68WJVI0nV7LsGSAIhSbmgVdGcqnY/yH3HKkNP
 6dsQnYNbHXHdRfC9ROy0afdtiQaAjflgo95n7sr6dSyIhXVH6YnDRyAJvFx0RIjNzZZoZJnPaMT
 oUI2M1KrdXvM11Zw8R3P3LHY=
X-Received: by 2002:a05:6a20:a11d:b0:38e:5535:bb4a with SMTP id
 adf61e73a8af0-392e0012363mr6614260637.11.1769877482166; 
 Sat, 31 Jan 2026 08:38:02 -0800 (PST)
X-Received: by 2002:a05:6a20:a11d:b0:38e:5535:bb4a with SMTP id
 adf61e73a8af0-392e0012363mr6614233637.11.1769877481572; 
 Sat, 31 Jan 2026 08:38:01 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c64276ef9fcsm10392441a12.1.2026.01.31.08.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jan 2026 08:38:01 -0800 (PST)
Date: Sat, 31 Jan 2026 22:07:55 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aX4v499Zz0CymZI5@oss.qualcomm.com>
References: <aXyRlFw7ZuhRPiKo@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXyRlFw7ZuhRPiKo@shell.armlinux.org.uk>
X-Proofpoint-ORIG-GUID: -vhrOgxYAO5QqbqKu2q3sspu-ZmdxT1l
X-Proofpoint-GUID: -vhrOgxYAO5QqbqKu2q3sspu-ZmdxT1l
X-Authority-Analysis: v=2.4 cv=P4w3RyAu c=1 sm=1 tr=0 ts=697e2feb cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=TRWK8DKzUZuuTiZSCyoA:9
 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDEzOSBTYWx0ZWRfX0e2t7oPTWZW9
 9+tCyaJPU22FtdDNfOZTnaVrQ461ptSHznAOO4csE6l7LhnsYMN4B+LCyQyefdnFV/412WZZo9/
 9j3uYaqwzjUHlgHleIw0qKHAS/C6x+yL09YSHCge566AZMhMbOm5xbAYTZSoIwh1hVUFpv1IxSJ
 YBX0fJ9ELu0+lnSXOBy528RZXY8+5JfHcf1SBE8shCoynJuXPGFem4YIVklGT0m2855szUoENq/
 esmuOoOplCecboFRnbB77wo46UO6rCnEla9DpcwZBeKnY8g9dWnTx31MRs6Olk1vUzyJ0OcOXNQ
 BGIf/C4I81guTqevtwYMa7rmlt44Dl/+mxlWcfLliZNu9XwOxBWrVT3Lb4A/H328AKvnOa8PHQ0
 QsQbJuhbnVfgentgT2R9IgJ1NMUrHftjaCUdrPTCgtcHZcPq5u5lBa603UPs3MX1qlDgxThcyvM
 3LHcaIauaRJAJQAdo9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310139
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: pcs preparation
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
X-Rspamd-Server: lfdr
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
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,qualcomm.com:email,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: 0EC18C30AB
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 11:10:12AM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> These three patches prepare for the PCS changes, which, subject to
> Qualcomm testing, should be coming in the next cycle.
> 
>  .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  2 --
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 ++++++++++---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   | 31 +++++++++++++++++++---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   | 24 ++---------------
>  4 files changed, 44 insertions(+), 31 deletions(-)
> 

No issues found on the QCS9100 Ride R3 board, so:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
