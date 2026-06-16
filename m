Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hwfGLRx3MWoUkAUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jun 2026 18:17:32 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DA9691E62
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jun 2026 18:17:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=gbta7TdU;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=eqinzN3V;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2F98C5F1CF;
	Tue, 16 Jun 2026 16:17:31 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4685EC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2026 16:17:29 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65GFcmSL3640678
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 16 Jun 2026 16:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=k8jmCjdOTgQQP3Z1ADzlmkhE
 ZtRTG+VtASOwyDTz8jQ=; b=gbta7TdUF6RhAfaKwmB36JsrXQPLO2pBds+OD6d9
 nKHaRAyIgTz7NxxeT4kAsQUIJCocUvOAmgffkmvki5Q6VI3Rd+b01RToTZqEVwOH
 QzNgjWF0gFkGKynJEPD7T9WeZ5MzyA6jZlfwswj/hacGUZrT3W70KTJ5cxP1TdwB
 +WViBjJ4SABFJVK/UPel1wBy3EP2/sYRKCZA/OC31JM+a+tKMjwRtomKGhB7EY1x
 tKjpS23Yf3gAdmBq6ylx3pkJ4U5UA6EwHvo0b0yPfS6mV4lDSy7z5Z88WS+H7JOS
 Zl/21WSpfszSNfTgUfKo44yX1wJogqbhzxT2FC6yj9xGXA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu253jc75-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2026 16:17:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-36d97955899so4598801a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2026 09:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781626646; x=1782231446;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=k8jmCjdOTgQQP3Z1ADzlmkhEZtRTG+VtASOwyDTz8jQ=;
 b=eqinzN3VxT8Fs60kQhan2R+2quOqLVXe84sMnjpbxyW+YZ7u3sC77wikWgENYx67XY
 IcXBkl9++4Y+w4p8nGqV2eWVRIiXZPGbgT5o3Ti4WkYGSnSdmsIB3vPmNXXeKx5imcKU
 MO0Skk4LBMOzYFbFGwnLmTfO054188TsF7m7EYrgEtplodOU60e71CaFGuAWqNvYGXVT
 TBFwVNRpd5ff8rab18B+/TmN8vlwKMLIvW3H4xrKXOApDpm35s+RkJfsuip0VrjnFKtz
 7hvq0h2/il1XaWza1/uCNHMoqQG5vTFwSVH/K1Dfzb1Xs79+/kxcT8N8o9ZfhDhZnhaM
 7oCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781626646; x=1782231446;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k8jmCjdOTgQQP3Z1ADzlmkhEZtRTG+VtASOwyDTz8jQ=;
 b=V1Tfpz2oUhF+dREqhjbfoS8oLIQ3R7EeWdV7XXjHQqeoscjlduLVnIhklfd93vreNo
 Ym671i58QZsZjlEZizmnt4DlOdUakRMtA63sT6I9Bnh4sm1wh4kkf0x1FdTGzSu69ybr
 yKWaGy77Px6jZ7OmswVRB0kYcaz3u7j9eoq362EBoRWeYcjc6P5CeeRjc/Gwbi+Vr+mJ
 IxMZKufZC6xsIZmHK07WjqZg7j43V2oAI2U8EUYZfyNpENnZv8uiMFklZUsgcDZpGoMU
 OwEv9t48RkG8wK8gJxEClOXqYdRs1lrACnp59SgEbK2vw46AP5j21c5wwtpN3em5gNjK
 /yvg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+FFUkn8SY1UlLT60NTdofTneaC4saHZKKsxc9E4mHlimHmXp86SZuu8R9VHzxZSUUVD6q/8L7LuHEloA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx9nqlFFbegG+WMazKQOmqP1sMh4OOfIuMNftXvEGt/r5eUaVYY
 xaOVLcMzQmdMo+/PHOM2gE5DOnNNdWeRPLXbMpjqwkSU5TpPjPmiqsB+iJeXdYnFl6jan3F1aKf
 Smz4AxAA/v9QLmXoB7g4l+KkCb2TaBgRCp6cTKMLWvjOMwMUvv/IMP1DyEj8rHCA1Ltt4tYlC+g
 +FlOSdVAw=
X-Gm-Gg: Acq92OGBF3fC33vi+IJXcvXBO0I5hTzjzq3Arsjf7pJ6uKPeSBsFcEMjJlAS1+f5j06
 QdTUSy0kEH0qMyXTXVCMTbkQQ9Ltr5hBjStmQKzkkMv31rHYgu4w67kunJJby2HAig3Z33XBsjP
 +/sNgwOe/M54wQRl/vAOsbwt0DsgrDK/GZYJLGpIhDJGnMa4rseNRYmknJSt1lxXxRPHltXazpS
 k8K7G/DJDO+M89r8peYscjXbgL6beSdOVikO4e/9Y9SxU5GQMzf6m184GfRV8Du7XUSA6cyWIEO
 N3Pz+2jcZzF2G8PCq1H3shBgsmLd8yAhQbORu4QGGU7ha3MMqCvQzuKrG2biJfRly79gcoC+9oJ
 idwzsP8EwWHw7RLn7oCJSiiBBBP73OVOJJ9s=
X-Received: by 2002:a17:90b:4ac7:b0:368:3d3e:efa6 with SMTP id
 98e67ed59e1d1-37c93969a18mr139693a91.20.1781626646576; 
 Tue, 16 Jun 2026 09:17:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac7:b0:368:3d3e:efa6 with SMTP id
 98e67ed59e1d1-37c93969a18mr139656a91.20.1781626645979; 
 Tue, 16 Jun 2026 09:17:25 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c8661a67603sm12281484a12.0.2026.06.16.09.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 09:17:25 -0700 (PDT)
Date: Tue, 16 Jun 2026 21:47:17 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Message-ID: <ajF3DUGYPBs1iU5f@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-4-f0f4a1d19929@oss.qualcomm.com>
 <45d7faac-7c0f-4f89-808e-06129e8420e4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45d7faac-7c0f-4f89-808e-06129e8420e4@oss.qualcomm.com>
X-Proofpoint-GUID: 9FHSGBuI-IHz-V2fAxHR5ClPpndmd97m
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE2NiBTYWx0ZWRfX7NhnpTNR/oeI
 Cwy9kDbNQXckXQnVoVDn7x0ShRwFjVIUy4Q3WJYs5BEWbMCIRXbDyoweuzgmrGnAPNqLk+RfO37
 kd+AeQlzeKtwmKczQhy0TLdllT+jMt4=
X-Authority-Analysis: v=2.4 cv=WNdPmHsR c=1 sm=1 tr=0 ts=6a317717 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=267an7I0AjvZusCT9TAA:9 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE2NiBTYWx0ZWRfXyveESYW+xh0R
 LOd39iW7vr00UfNCXDowRQVzV6JuOZtNUfRySMjQ9h1zi/Fjdrru4tPe9aNSCoRnmUgIVnPxodG
 w0ekpNwfVRKEfFsQLxJWfwxJYwlWtVXxx/2gl8WrLjcKwqEiXkzgadjz8Gyd/zj1a02dbMP5ikq
 zbfZCNLxyYyqR2+nRjntPvAqba0A2GCXHI8EHHPbprZ5s82YWbVg3yZcISQhfSSJLSiAcWi++0D
 CdubKL4kTyzw6yUokitT3rFagqYKhv0ULQCQoufgk4Q05zb0JQNkOSyiZqCWG+S/D404ryfiGp3
 c/Rlryy3Q8nGRo9i7awk3G/aeHu6eCqFFkInFVvmYwQ/xWO+FYaYjQlRaPZB9ns0a2M3BmHI23W
 Nwfd4/j/ycb/numN90s8R4SY8q97ZepWW+v7NBDra6kB3e70OxTCA3L+I9k1jSzS3dYtGzTzcwU
 dW6krRkzb7thhJzcvrg==
X-Proofpoint-ORIG-GUID: 9FHSGBuI-IHz-V2fAxHR5ClPpndmd97m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160166
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH RFC 4/9] net: stmmac: qcom-ethqos: add
 per-platform NOC clock voting
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,armlinux.org.uk,lunn.ch,google.com,lists.infradead.org,redhat.com,davemloft.net];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux@armlinux.org.uk,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:davem@davemloft.net,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42DA9691E62

Hi Konrad,
On Mon, Jun 15, 2026 at 02:13:05PM +0200, Konrad Dybcio wrote:
> On 6/11/26 8:37 PM, Mohd Ayaan Anwar wrote:
> > Some SoCs gate the EMAC's path to the System NOC behind dedicated clocks
> > that must be enabled before the DMA can reach memory.  Add
> > ethqos_noc_clk_cfg and the corresponding fields in the driver-data and
> > runtime structs so each compatible can declare its own set with per-clock
> > rates.  The clocks are acquired during probe and enabled/disabled
> > alongside the existing link clock in ethqos_clks_config().
> 
> Sounds like we should use an OPP table instead, we can't just do 
> set_rate() on qcom, as that will not propagate the required perf
> state to the clock controller's supplier power domain (i.e. VDDCX)
> 

Understood, I will test this out for v2.

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
