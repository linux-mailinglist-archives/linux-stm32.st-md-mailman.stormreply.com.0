Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DOFxOlzApGm2qgUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 23:40:28 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F82B1D1E3C
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 23:40:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1ED05C08D19;
	Sun,  1 Mar 2026 22:40:28 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F84CC2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Mar 2026 22:40:25 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 621LNQZn2824940
 for <linux-stm32@st-md-mailman.stormreply.com>; Sun, 1 Mar 2026 22:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=liHMhkUZwLObZQKcaR0dCOsp
 FbGoGsXIqL6LcZpPJfA=; b=FmVl9CSH3WuzakbWRWrtDYLnsJ1shhPHQUPlDcIe
 +9lv7bblF8fP0J2Pw0MmfcBT7vGoLQmrPCXiIyWaJu0Jpx38Gh8RfROnel/TuF4+
 FK8jVR4/TdHq9zqhye2kFv4nJoZqwxlJcfl5J8qRo40FtvI5l9KnemiwpioGxqWy
 2BKC+M5JSMqOQ8tsfh8ybY2Ho+JnCHu63zxiQh4uw/2OG1SYzfPgHMYDB2q3qeWx
 gGAk5611x3LjEVhtnZ1p8DG90CP30UrenFVjdemKCH2eU1rbTYOYVyRxM42JCdM5
 pOKXaUr+dFIY4po0vGSiOZXqlE3IeQ0GEjUxAoNgI3xOhw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshd3dw6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 01 Mar 2026 22:40:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c711251ac5so3101059885a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 01 Mar 2026 14:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772404823; x=1773009623;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=liHMhkUZwLObZQKcaR0dCOspFbGoGsXIqL6LcZpPJfA=;
 b=Ew9kVKmFddUtO4q9uakdD8LhVPtw51FeQjP4knWLIqDA7ZGVua/OPkh6uWQvJjjCWv
 4Sw8uzjbeukGQr3FeEXcF6V1gKg6k4iKk/Zp0OB97OBnxQt5P2Xdxa0BHRoha64AShDt
 VpCT/96ahNmvQAAElnPyVvKU30WnBfE1xd4jp76oxkT4xzdfJBb43AIo8qIwW+QQlTv3
 8BLnlpZfDDKxwQIDLraAPPRV2Q4BEgJdtPFToCTJnEie8pE08AXDoA4JcTZj21FzON2a
 MEDBCBLyUU/32Q25U0e4gBrZmp6T34MJUCT4xEzkhk6gZQdIzc/ThCpRLp+LET6nwnjh
 5aFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772404823; x=1773009623;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=liHMhkUZwLObZQKcaR0dCOspFbGoGsXIqL6LcZpPJfA=;
 b=UP5WnvnvGy/GrPT4XoBGIjDdABtvAOoE9Et98LHJdfY7SJOPS34SLo9h1Qkrfa0prS
 NLvLlZLJAN9MPyuPWjVMgl9KBCPd3dKFscvSr/o4dPs/p9Qxm1B4RpxcbE7USOEaWDrt
 B6thhPwC58+Dn7bRK6BU2J2Wa4JBnjSfMgDlYDRXS/DLz6AT2Yd4exIfimtUh7ADTfA4
 GKsVoBO+T8Jp03h/yWDsXEmlSLmxeIF8c452m+QQNzjhI7LdOhmZpZCaVebYnlpcYkTY
 Me3zDhOzHcvM7f9Vi2xbwHSgmowcogcRS9u/WokmOJ5vQAonulqbsG1UML+ApYZtLade
 lDkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzTJMb95flQbS7ivrJcC5lwLzbiQ/EmSeGBrUKHX3FfGAt0I6POON6N9TyHPeOdXGk/aB/lT3iCbd45A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzFEJ1KnE85suin899k/CjUAY/aAvbcLIFuHqTYK01LU7Pf3RRn
 X/Pud6WB555eeLQRL51e2KWJ4Y48rOdgLDG/H1pT0BqKa1DUWB9WrCYedpRndmfA30I+VFglmc3
 PfJ5WgCa92sMFawJXuBHYuOA/MWC/nEyznReI6C4LOdor7GiXLbu5msByTnjEwRuj9YqHPp9EO+
 10Ziw5Quk=
X-Gm-Gg: ATEYQzw1/QShq5X9N8RMh3sVApFx52JXJbqEnJjBNSA2FXJL4SWOwkvSIcozZjoQHt8
 3X5R2YVEMAZ1aZ8pagsW+i5tUoXgkBmmCyMJGkPFyNrtS5eeHUhT+Bvw7S2H2lLoyFGbf21/3Qu
 3k3S0coAT/8N9x+6ovnJm50JeB5nWm2e4f/16JQ2g6AnBTpqVI0Kn9XMYwrd+ISSOHdTgAoXzEx
 LCRc2GRFzFE94WtP7gFIpi99CjIqMpEjHX/36JGvkWprJVbif0A+tQBDPPOGoQn2pFQDH+vmg9e
 sg7RJZ45MKVhigM6tVNOb6J77gzPzKYjSUxQbIH6bLGsXjQqQb0kRHEVvBi3PsBteL2HxCPXqfC
 5qSl9CLR0Hh4aBKXuQF0sxRIVm4M/ecVDR5+XE+Dqh2MPsTMW/sHjlvOjs++ul+XOmAU7HQxgfU
 aFatAvqCWeLm+0XHiym8PWDVU8SAAwN+/Pi00=
X-Received: by 2002:a05:620a:4413:b0:8cb:4a64:f482 with SMTP id
 af79cd13be357-8cbc8d83cc4mr1468462885a.18.1772404823113; 
 Sun, 01 Mar 2026 14:40:23 -0800 (PST)
X-Received: by 2002:a05:620a:4413:b0:8cb:4a64:f482 with SMTP id
 af79cd13be357-8cbc8d83cc4mr1468460285a.18.1772404822548; 
 Sun, 01 Mar 2026 14:40:22 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f3016bf6sm24553701fa.32.2026.03.01.14.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2026 14:40:21 -0800 (PST)
Date: Mon, 2 Mar 2026 00:40:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Message-ID: <qibmsgfttxo6kiaqyjljj6otamqp7okfr4abwpmuo7daanl6qu@ka33zvoz7lte>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-8-22c458b9ac68@ixit.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260301-stmfts5-v1-8-22c458b9ac68@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDIwOCBTYWx0ZWRfX/DXRjTpVZjjt
 hSvQ/Xg4MrSbyA6IlHBugDNHXNJzMuPZjcJxmMfxtBPF32xBHdstiUm5hFUIDksR+FW8MQPFEtW
 7WKxUX0tPwq3srXFiiqBjKaXqC6grdHVt7LsQCCoqob46vJcrE26VYPEWf03WQz2O11YDXPH21x
 VvmlafTP0BmPFuoUjss3m2ydmU6h2fWaqLYiVRwR1txxejuw0QeQGYAhmXmf9T8jdx65NL3P4yq
 rp0np9RG9+r8eoyXuX2NzI9gd9fnYlGIlPc0Lw/vquOW7DC+3mgeA5VPhwTx9T82b75ewG5+yXj
 TScbzhjD62BNcgfPBEJjNfAd91GGlVD7V4SmCzTh1xd+UeGoSL8xiDEdVsU+G5tmCFFxoP8+XES
 9VviSibj3n8VpbySPC8QldzGdLVUtGhC/tMo4iPQPEzaA8LIP2VrgDvxttuZFxT7LXuLkAd4xRU
 KEvLDWS4LoAjlaE43XA==
X-Proofpoint-ORIG-GUID: xMnrzMQyNTU7nQj8iBhQeUnMCFYVExf1
X-Proofpoint-GUID: xMnrzMQyNTU7nQj8iBhQeUnMCFYVExf1
X-Authority-Analysis: v=2.4 cv=COYnnBrD c=1 sm=1 tr=0 ts=69a4c058 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=tZRLSl_A3aL-_mRAmj8A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_05,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010208
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Henrik Rydberg <rydberg@bitmath.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Petr Hodina <petr.hodina@protonmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-input@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, phone-devel@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 08/10] dt-bindings: input: touchscreen: st,
 stmfts: Introduce STM FTS5
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
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:robh@kernel.org,m:conor+dt@kernel.org,m:rydberg@bitmath.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:dmitry.torokhov@gmail.com,m:krzk@kernel.org,m:linux-kernel@vger.kernel.org,m:petr.hodina@protonmail.com,m:mcoquelin.stm32@gmail.com,m:linux-input@vger.kernel.org,m:krzk+dt@kernel.org,m:phone-devel@vger.kernel.org,m:konradybcio@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:dmitrytorokhov@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	NEURAL_HAM(-0.00)[-0.989];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,bitmath.org,vger.kernel.org,gmail.com,protonmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,ixit.cz:email]
X-Rspamd-Queue-Id: 7F82B1D1E3C
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 06:51:22PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce more recent STM FTS5 touchscreen support.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/input/touchscreen/st,stmfts.yaml           | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
> index 64c4f24ea3dd0..329d89977bdbc 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
> @@ -19,7 +19,9 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: st,stmfts
> +    enum:
> +      - st,stmfts
> +      - st,stmfts5
>  
>    reg:
>      maxItems: 1
> @@ -53,6 +55,19 @@ required:
>  
>  unevaluatedProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: st,stmfts5
> +    then:
> +      properties:
> +        switch-gpio:
> +          description: Switch between SLPI and AP mode.

This doesn't sounds like the GPIO on the touchscreen, more like the
external schematic component. If it need sto be turned to one position,
it might be better to use GPIO hog for that.

> +
> +      required:
> +        - switch-gpio
> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
