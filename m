Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNI3I7+0lGlbGgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 19:34:39 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3217114F2F4
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 19:34:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC691C5A4C5;
	Tue, 17 Feb 2026 18:34:38 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B203EC055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 18:34:36 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61HAoIKb1613301
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 17 Feb 2026 18:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=HZElJviG4NF1mW6UtvdcdLWT
 vHSgF6zYjPqp+73i8VE=; b=LHxKULUR8AdJLUA+Vd99o1XvUr9hZBufaxlm8UJC
 zwiHJ26uBNAatSzFqPVa68DvlOHxOMy7OGM6H3Gg1z+NHxOLoMqS+ojcaEKd04AY
 xU+US4BBAKk6ZlehHl/K5KjN+7mZ8Z7j5DuXlzvhn3R6ewBFuJHpLGc1NNkM3KIg
 SR4ei5eYh+RERmNU9lawcDgWB/r5sl0OnOGZ70+RnB2baaY27+txWqjrp22gIkzZ
 e9t/Jzjo+PQ7L4v9SL9BWjJt0xJSaTMlq9pOZtJmhw3ptQPoS4mGW0TwR0nkfrVK
 yDDS5+SIa+0zUht+7RmLCxLpOGhRk9N9APyuiNYz7nRWag==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662ujua-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 18:34:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-354c7a38429so87744a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 10:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771353274; x=1771958074;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HZElJviG4NF1mW6UtvdcdLWTvHSgF6zYjPqp+73i8VE=;
 b=CL9hJidHWwyq7iTFIwL6VO+lOQ9tbVxVHdasXiZaWQ/+PeWXZt7aCRRanaXOBAGJ1Q
 QNiPbJXzHEPSajtzUj1ONfPd49Mw9VEDITI/Kjhg3u+HZ9BwhZjOWOMEDPEbmxsWuHGD
 34zJOQTKeoXbL/9NWWtcN+3Gpo/gZm094ZpVgmnfXsryD4mz5f/qEPHlQdXmHUaxOms1
 Wd2ZeSALrTnOiQKFQoJCZwHwe8E7WDAE52PGuDeMBaTodzVN5dyiNf7K6xD0wdxe73Sa
 uaEsL6VvsvVs2Lfd0u4yhaTaw/BZSMJjpiZFku9BMrICTfY3bC0uEf2YR3UErIAa9DI0
 7K8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771353274; x=1771958074;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HZElJviG4NF1mW6UtvdcdLWTvHSgF6zYjPqp+73i8VE=;
 b=L8+XTAms2VBdmo0QoY7zfYTmR046xTI+VA69Puq4N43H2dJUJ77o5amVtaB/mt1p/3
 KQ+l15UDx8C+mWgLn2LkInLR+noiEAjdp6Gg5CHro0cUbIf99iTDtELRXI34OMtZY7K+
 nDds8OdR2VUk24gKPFNW+AVtRFjqlnzgxXPE8meJ3j6WAXctQ0MFZvnfy0IMlWeymYBY
 4rc5PzrVRzcsO+k0S4I9GyBnPIdJcjlLgns6T/Qx4m2RBIF2HJIKO+qkIA7Ebq7KZaNg
 3dUlgwcEm8XssICZtPf3QeNL8CRWtv6SSNhvycxNC0U8qyXhMt6FL0Yr2DQGXE5ktkiZ
 BadA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD0i3/uQm1gt8IwdNTwxTUSOMSFR3Fm+9Q82mYTzGydh6H+BGSNWHHP2iePtWo0mUoek7axkZyJ4TyKg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx2nQmV7ryGAy/UEk91PIcQT+MEG3oA/u1oTQ/UgTf2rt+z6Gq8
 ER55hPF7RZ2vmTIxjJUfNN2Dkt0LCEq156ypGcM4C63PBKyncG0OszlCYbcuRfXFl/CdlM2GgA6
 otHkWFjyA9Ut+Msfe11l/vbtOXq8hFOkkGaqukd2hebWEXwGkDDrEF15pEFMPenJGc6aK/3VGcV
 rZi0bDIw8=
X-Gm-Gg: AZuq6aKbI+8cUtnz4ZfVMc+qveCsewSkZtnaOXJIv5L67M3i+vnUY3/fY/QYREpgKfp
 MOd4laDAJaZEL3z+uLcy6KOOeDl1/qNUjofZvtEeNe3ni8DlnJ/RGSRz4pWCLM3TxEvfN+NstUh
 KKSMx4IZtnh2dZj0pnKOxkMos/E7u3LP++yUvwEGbQ3KU70Jqr7dpvR46u1+Vyw/Ud+2YVMUsps
 H4OMXJSX5ojnR7d2GW69bOWqK+PryQtFtkzBBe5zeNOWnsuFppRB/kbEmVajlezeDIE5Dq8V51g
 UjNlWyyTwGH15iKsnyFg9Y3ySz3W8KPPReEbumZCEyU8q9S4MPBptO+2st8y+3C2hwQEJYYPRP+
 e7+6wjs4TsX9uRe2l5EG7JmVc/xIkbfNNQx8=
X-Received: by 2002:a17:90b:2b8f:b0:343:3898:e7c7 with SMTP id
 98e67ed59e1d1-357b518ea91mr10071984a91.12.1771353274190; 
 Tue, 17 Feb 2026 10:34:34 -0800 (PST)
X-Received: by 2002:a17:90b:2b8f:b0:343:3898:e7c7 with SMTP id
 98e67ed59e1d1-357b518ea91mr10071965a91.12.1771353273637; 
 Tue, 17 Feb 2026 10:34:33 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35662f8cc57sm23799159a91.13.2026.02.17.10.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 10:34:33 -0800 (PST)
Date: Wed, 18 Feb 2026 00:04:26 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <aZS0skzczDS9g2Xj@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKOv-000000093mB-48ei@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vqKOv-000000093mB-48ei@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MSBTYWx0ZWRfX1mS4PN0m78fb
 BNO9nOt17xvUu9GjEIYxfUUf5ZOd1A+Mb1GzMjlL8VbicALpwWexLuvd/OBmS3N3rIt5gTxukPl
 WTKTfMyJw0zutWpCjJ5gsYBudTPxylTBteuYOkRFzcALQT0fdPaLlQEDls17+0x41NixhDksGZu
 WCMJ+LpB/Wjw5MwA3UoX0coy4U2Fj8/gMW22qrMIS1PLU0ZQ4VNufY/Eu8OX/kg74kzTG4CqPli
 tw+BvnYI1BqHe2Bk885bJpYQDYyPzQrT8viFL0MrReDI2XfIqn7vxqIjy1i+wCdJnrV4OF/3cU5
 yXz936bMrFWrLi/hyS01MJKoVeqxCDepPmVBsxiEy+VYUz/Lj7kcSMujd/cy/9HcN0b6zNMRAlw
 ropJruqgl2Z9zWBU9Bmfmn7h2jf4tzMuY77UNIcYJHSK9dUTgHRubK8whOrADLTU4UVmrbebnRj
 32fVmsbuaZDcepcvELw==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=6994b4bb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=AnVTdvRHBf_CuTIAticA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: GSXLAKQEQDYK-uF5emanDW7F-UIN9NrF
X-Proofpoint-ORIG-GUID: GSXLAKQEQDYK-uF5emanDW7F-UIN9NrF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170151
Cc: imx@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next 1/9] net: stmmac:
 qcom-ethqos: rename "por" memebers to "rgmii_por"
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:imx@lists.linux.dev,m:pabeni@redhat.com,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:Frank.Li@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kernel@pengutronix.de,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,qualcomm.com:email,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 3217114F2F4
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 12:17:45AM +0000, Russell King (Oracle) wrote:
> Rename the "por" and "num_por" members to indicate that they are for
> RGMII mode only as ethqos_configure_rgmii() is the only place that the
> values are programmed into the registers.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
