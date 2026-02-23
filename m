Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJklLoshnGkZ/wMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Feb 2026 10:44:43 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3FF1741CC
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Feb 2026 10:44:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B9A7C3F944;
	Mon, 23 Feb 2026 09:44:43 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 765CAC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Feb 2026 09:44:41 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61MMneT62783699
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 23 Feb 2026 09:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=s5Q1vewngJBr91qKkgV5B9pJ
 GBBUeF9wD7BUkTBzUfE=; b=n2MBqtR7gZ7QAYFzUxcvE7xcMUV1W5cLFgQKuEv5
 1KDQfXbHtb35D9yelPJZHf5693s843xj8H87QMweMacHIo/3UJikgZAf53lPxm0u
 Uoj3QwgVpAzYjQh8q09VaLvcHESPeyzvQgkswD1htJ0XsC1MYTRZtVcMTGtamxK7
 2eXX5BJXYJtZGg0KyXsjcgpsarZm/ww0OsJQ+RUQJtEIp8S8T5Mjq2qoHrg6tKeH
 kyyCNKRuFNaR7LVHRvOvuItfjYsEI7O7JOXvFHjvd7kXn5TC0/2v7phbDFfP8ygD
 PXA5l8ZHheUPn17OeqJkIn8OROqOTenQScspNmE1Yrqx5w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgv7tg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Feb 2026 09:44:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2a784b2234dso92840015ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Feb 2026 01:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771839879; x=1772444679;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=s5Q1vewngJBr91qKkgV5B9pJGBBUeF9wD7BUkTBzUfE=;
 b=b0EKRxS/UbEjlKNNE2XoSZJy+Pjefmjm8klHcF96/IY/uwvPXLMIFSD1Lf/WxDQj1V
 tk6oC6bq5wDEP0IfnrdyiRAFngvHYFILMkG2jZiluLjNqeONi5bEIvRl41BzN3IzdD64
 /uAb9nGgZAfFGq7au2LFPcRfoT/IYT1nopgP9jWPgw8BhyuiOqVyCFbnM2pjwFIVrvdt
 UlXoA6BLFr7oessEJxu1i4pq8NVbf0pUJFxouvdRN9tgTyx9aX7v1TZsrbJ9zCugzFra
 9rvIREwSRd3VFVZKGH1YlocYtN2X1+iYakBErd5h2Yxa59hO9M1OAA6XrAIKMppey8HQ
 /ZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771839879; x=1772444679;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s5Q1vewngJBr91qKkgV5B9pJGBBUeF9wD7BUkTBzUfE=;
 b=oeqDHUYrPZcp4CTd4LGmtRFPAj4IcSPyUND44+BRsVoFCWOF1sQ/v4TC/v8XtA41Ea
 wY1KTUIA7wHzbr3foRKAsAdfQDaXeCASd+v/UZCEVfRHz3CdDbnFjeFQWUKzU8fGMvDt
 LYy8q8Bfq6HiJ+sKlOn02+1g/wLfUptHBrdldqtxZJvOO458zYUgwh7rpDHaEDzZaj8v
 EdrTtdUJ/rmvKQCwZE7RS4uAkyDAhOtql9ik5mWiIHohtqllN8u7As9jT4JyZyOR/Fz7
 ZAfGdBH7p+ff+ZUc716yFRMNkXrgruw1B0hEHxz0z4i3EIu5gv+IOLLY7dd6YUrnE9Gq
 YiQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXorJWYpQL9+zgvcvCOpoIkK2KdOVwUBNZKN8YjU/zYRuau4GPlCiZLk5nk4zhrcTOcmBo+aPghPcr20g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx/9f4KvnEsypeeq0NhshiOhEz3F4RFS4vxmwM6zF9xTL0acO6M
 d3siOmdGE4hsS+B3qCadtF/v0YjuSQliA2+mqatxKkaKB35lsHcAtUpBSpyPwiBe+NzWuLDGygk
 S4qfg3wq6BuFmYer4bM35o89J9K1gsnVbFFi2b2GbvFD2lt1S3M76Duj9KW79xbnNRiEx64ZsYj
 v9T3+C0NY=
X-Gm-Gg: ATEYQzx8E7e9l7eJxYtTBwfL5dHvSDJbjZCdWizSe7Y08yaNmX8gFCd1XUzgHV8uc+R
 rzMo+Pbgjvmm1FGuEI8T8AefNBtcNUP+7/rZFkMUhgy/aCnRKMoKNEbCaXzKnl96trxmjDf6H78
 RRAImiYHs0/J70o3GgdfPXQGcfuyAc4IaYebAVtmbTX+z5Dc+CHUwjIWsFdD9RXsb+lAtrDtp4H
 Khnx2laVcWU2NsRbN7xCIcLdwTD68shEOrqyJGISZgw/G1lyMvwJlyP8peUWV054dO4gnAhFvj7
 nD9BCCcfWlXATApm/UEDiAxhBjFZ0IAtYCUt33OhXyoVTXoya5lVw/wZXknvjyH+QudRoDEDaHX
 CyLbZP28ihPJa09mOMpxWDx6WwM0CYZOEmHA=
X-Received: by 2002:a17:903:1aa8:b0:2aa:d1e1:29d5 with SMTP id
 d9443c01a7336-2ad74556f97mr80694105ad.50.1771839879054; 
 Mon, 23 Feb 2026 01:44:39 -0800 (PST)
X-Received: by 2002:a17:903:1aa8:b0:2aa:d1e1:29d5 with SMTP id
 d9443c01a7336-2ad74556f97mr80693685ad.50.1771839878545; 
 Mon, 23 Feb 2026 01:44:38 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad74e34247sm63334265ad.6.2026.02.23.01.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 01:44:38 -0800 (PST)
Date: Mon, 23 Feb 2026 15:14:31 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <aZwhfzkk740kUegR@oss.qualcomm.com>
References: <aZcGxDBwfMXHbo_O@shell.armlinux.org.uk>
 <E1vt3US-0000000A5eE-1RHM@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vt3US-0000000A5eE-1RHM@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NCBTYWx0ZWRfXwcY4uKwJ2bE2
 kooyz7pLIqFd30+yfc1M/vtVwsZritAOhsBOcwOtsYmUDurGYv0sek5WHrywHfGp1/0afWTMAX6
 PwYbvSl75ljIBkQ9251f0MMZljyeUr3WdRp8wpbxURSRXWzxPkXGPuZhbb0No/wFkDrn3wFYKfS
 rG8dwZouvsFSjh8O+UCsJczSr42C1dQpWSKGjyHsUaDkDNe9VjAsIRToguc8v4TIQX+Jw/kw6/I
 vZYSjNe3JYLFrMwLWcHXbvHwntPFPAxnIvsLMTu8ewlvnhFGElLZXBH5PGhjQcZnGrSCcGuL+E0
 63dEdtYmvwq9mi+w4DNKPsfGPsca9KOIFwdrYJmpb/tuE5yudCZIsESBET3XyMxYbIP/YWN7zZt
 yvV18ozTDtllL+KWx/MDUXoKIudXg6uTp6zWDPXpMvUaLEkWNosyGm91CGGsf+/AXdJE+zpC84+
 VT2C+O/lAcL+BSPNOKw==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699c2187 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=McwRrj-fpISi4v25ROEA:9 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: I9GnHeWjYEqIgv1_RQW-_e4Sgd4gZOlD
X-Proofpoint-ORIG-GUID: I9GnHeWjYEqIgv1_RQW-_e4Sgd4gZOlD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230084
Cc: Andrew Lunn <andrew@lunn.ch>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next+ 4/9] net: stmmac:
 qcom-ethqos: convert to use phy_set_mode_ext()
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
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:vkoul@kernel.org,m:netdev@vger.kernel.org,m:linux-phy@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.955];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,oss.qualcomm.com:mid,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 5A3FF1741CC
X-Rspamd-Action: no action

Hi Russell,
On Thu, Feb 19, 2026 at 12:50:44PM +0000, Russell King (Oracle) wrote:
> @@ -675,20 +676,16 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
>  				    phy_interface_t interface)
>  {
>  	struct qcom_ethqos *ethqos = priv;
> -	int speed, ret = 0;
> +	int ret = 0;
>  
>  	qcom_ethqos_set_sgmii_loopback(ethqos, false);
>  
> -	speed = SPEED_UNKNOWN;
> -	if (interface == PHY_INTERFACE_MODE_SGMII)
> -		speed = SPEED_1000;
> -	else if (interface == PHY_INTERFACE_MODE_2500BASEX)
> -		speed = SPEED_2500;
> -
> -	if (speed != SPEED_UNKNOWN && speed != ethqos->serdes_speed) {
> -		ret = phy_set_speed(ethqos->serdes_phy, speed);
> +	if (interface == PHY_INTERFACE_MODE_SGMII ||
> +	    interface == PHY_INTERFACE_MODE_2500BASEX) {
> +		ret = phy_set_mode(ethqos->serdes_phy, PHY_MODE_ETHERNET,
> +				   interface);

Shouldn't this be phy_set_mode_ext()?

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
