Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Pm9CESqeGl9rwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 13:06:28 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A844C94017
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 13:06:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BAB1C01FBF;
	Tue, 27 Jan 2026 12:06:27 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D72E6C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 12:06:25 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60R7QS0H658800
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 27 Jan 2026 12:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=oJmDDECkW3iXsL3g4I3qEOxh
 a59jVBDs+hiTdIwu23k=; b=SFCOd1M44pt3IzqJIWZy8H8I/QoiF7NXN0rgT0ia
 B19mlTG+dl4OUrVUz+NXmZkqvKzSH2Fy3/oQD+kZqHrZnwT/VkWrDinTkbzmE9N4
 YN/6CH3qZXc7sLY6wDnxZMMpwUbpoQOXpE0OJJ0mQIgoYkVavb9Ro6QrJhqTa8/f
 BtArQZVv9m3PyvBX9f7eu7HNoyjTIkDkjvxpexz8b61aHAmo2eufC1MIrq9/1mDB
 +fR1BvhXvb/Q2Q6Sa1IKodpPpKIjNik88CcAuBXTSBkKa+zINxdheG7EgkxMWIGo
 Yvlttka2K2gQdZXxgdXi/wn6Lf75pJ+xV3BjyoVHuJNj4Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxryn8ymb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 12:06:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-352c7924ebcso5061553a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 04:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769515579; x=1770120379;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oJmDDECkW3iXsL3g4I3qEOxha59jVBDs+hiTdIwu23k=;
 b=gonSc1JYokjEya1DWj4Z9mNJjffbeN0Q2+LTO49c+DepYxxy995/w4iLpkm2GcpnQN
 T6fx4r2+XGKVQv29dvMk9pQomTwJthYGJLca8cdZG4ePiPVVesZs4DBQxIguOePie6cF
 b88jG5LCjJ6tL91mjnoqkY5GMcAQ0VWW9Sy3lYkyvBMlP3XWhugFpsNSnYKLyIOfDVNF
 ezd0lhKY4v823s51uFg0W9GaVHzEc9agDco/jrfE9Fk63dEB2KMKRc+tplhlYm97aN52
 R88kv+2CX7dGKorPk3FCkJRNuyUIPseNG20RaPOYTjODyszBRFEyJZ+FkY3NG+vvpkvr
 qwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769515579; x=1770120379;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oJmDDECkW3iXsL3g4I3qEOxha59jVBDs+hiTdIwu23k=;
 b=HZpCUv5aTch4bY8TX7HQtot37SCrJjbKHt1hEUOY4uGDOXqXhl/n/Kcytj0sgWoztI
 gqiQpVVKCHxfygDXoCntYSEi1+DcIQpqDk8cyPoT/2nHrd6ojukp+s6KlmhpabLyTs3x
 bCQzJzy8Qds2/MCLraIanqEzYexv1Dm6VQrBSkxK1QfDocCarGmui3S8IVSs07orMLYq
 02s2pExVxspkKvkjsPLTmkF0XJvdvVIw4Bmw1ok9lrKb5AR9K+v6832Zs3U9ZgNM22V6
 l+rW3w/pJWFuOwmFFDeLEUJZpqD+77OEHiL++IuS0bzIej2khS8djuI95hZkWOvhT0qj
 27lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxpimJuMtXgu5VzeSh6VD8ASwwXgXsKhcGXwZR1LcnCTUlKMsv3h94dab32vWgeDa79cmPf2I29DeyEg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyh7KkqKIpf2jJK9wn/AIFMUc/pCaLaM1bEGbFQNAk+8fBnXiV9
 LuoJiUFdR67GTHa8vGldyl3PN6n6ryeUViHVZ9Uw5O2iwJLBo5d01MrMlKEVJBmyAjufvQWa6OF
 0w7gBUehiOWbLGJbeZZtShwt/raR1De4ZKuVzuiJpIaoDvUuEq2Mrq0Rx90pPMzvyyLzQxvMAVs
 JPRRhOFrQ=
X-Gm-Gg: AZuq6aK0n+FCrIed6B0dKG8DiWd8PHfoWbGY0VMd688yRCgXppfXRmZGRYXdGel0QpI
 mzVenxUqIZwtOnAy6HlVk13TN/33IwptOFjEbMYRLMq1HrrsKwIhKalH0pEJgZsl1cDnIznXfVm
 4upP2p9mhtuh+oc/Zo4zyajYo5bPjFujN6xeDVuLl4bk4mx1kqcoDKPHDqVS09kJVYVaRMnHtkY
 zo+6onYKrc26eJtK0Wwb0voyxAbRv8z6V92XfT3OG4qqIDOUfsCcbIO0xuyjhYUe/st7rDSqUZd
 L0OJ6Qfu7NQ2Yusp70RNd12IyByEvBbOtWZD8g7xWSOJAuxVmnf3cvnwXIid2JFc8mpWtgo//MB
 6DWTJZy0dQE8tm70Zc/d2GJs=
X-Received: by 2002:a17:90b:2dc9:b0:341:6164:c27d with SMTP id
 98e67ed59e1d1-353fecc66admr1463648a91.3.1769515578702; 
 Tue, 27 Jan 2026 04:06:18 -0800 (PST)
X-Received: by 2002:a17:90b:2dc9:b0:341:6164:c27d with SMTP id
 98e67ed59e1d1-353fecc66admr1463627a91.3.1769515578192; 
 Tue, 27 Jan 2026 04:06:18 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-353f61292bdsm2411832a91.6.2026.01.27.04.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 04:06:17 -0800 (PST)
Date: Tue, 27 Jan 2026 17:36:11 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <aXiqM+rYK/QCy6DW@oss.qualcomm.com>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <E1vjDr1-00000005fQ3-2rcn@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vjDr1-00000005fQ3-2rcn@rmk-PC.armlinux.org.uk>
X-Proofpoint-ORIG-GUID: O2KjWl5aMsIrDKwyt5YRbCVdN7WotXAg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5OCBTYWx0ZWRfXzOS87UfdgmOo
 i2gHGF2PjUENA90K6e4DM4hoaGDUEQvyVlZsOz5viEuNS/ig7lg581pIQ5rgI2L95jMSN20FXZm
 N4go9gZ0LmibV30BZzZi7RS4pcopfEFc8WdsHiV7S303Fn4jE86ypE6FcpreWHuqTXeOB1i0hne
 j104XjKZ2VcBQUGcrOn4xaV4tZu2PlMIzKQC/pcJ5AGZN8LGnoqKo9ptLLkl0F3+u20zIOfDnW+
 Kc0txuhq8Pj6D5fCZIYiieXYuKk4GpEZKMdhSkDI2n4+0S9a3aJjJjZvdpP5QbJdxYOpvAhBFAj
 Y1ZyL6tvkPTviRU680iY9MkyJ06SEhUSGdKHWHEncexTCpnLrhmATyFwAHjqurf4P31fMu/SUXz
 RrLa4iK44k1z3zikBLOKeJNxNScRS8+DGxzbjvngq6d2EoH+gZiwuyAE4XenSCZ3xvYGlzQwlpG
 PdwSQJl6K+RcaGpeR7Q==
X-Proofpoint-GUID: O2KjWl5aMsIrDKwyt5YRbCVdN7WotXAg
X-Authority-Analysis: v=2.4 cv=FsEIPmrq c=1 sm=1 tr=0 ts=6978aa3b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8
 a=2f8CEio2oMm2juszzV8A:9 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270098
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 01/14] net: stmmac:
 qcom-ethqos: remove mac_base
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
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FREEMAIL_CC(0.00)[lunn.ch,redhat.com,linaro.org,vger.kernel.org,st-md-mailman.stormreply.com,google.com,kernel.org,gmail.com,lists.infradead.org,davemloft.net];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:pabeni@redhat.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:vkoul@kernel.org,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:linux-phy@lists.infradead.org,m:kuba@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:hkallweit1@gmail.com,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,qualcomm.com:email,armlinux.org.uk:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: A844C94017
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 09:53:23AM +0000, Russell King (Oracle) wrote:
> In commit 9b443e58a896 ("net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
> modification"), ethqos->mac_base is only written, never read. Let's
> remove it.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 0826a7bd32ff..869f924f3cde 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -100,7 +100,6 @@ struct ethqos_emac_driver_data {
>  struct qcom_ethqos {
>  	struct platform_device *pdev;
>  	void __iomem *rgmii_base;
> -	void __iomem *mac_base;
>  	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
>  
>  	unsigned int link_clk_rate;
> @@ -772,8 +771,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
>  				     "Failed to map rgmii resource\n");
>  
> -	ethqos->mac_base = stmmac_res.addr;
> -
>  	data = of_device_get_match_data(dev);
>  	ethqos->por = data->por;
>  	ethqos->num_por = data->num_por;
> -- 
> 2.47.3
> 

Validated this patch on the QCS9100 Ride R3 board, so:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
