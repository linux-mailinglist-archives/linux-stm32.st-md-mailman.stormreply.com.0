Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C24569DACF
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Feb 2023 07:54:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F4FDC6A5FE;
	Tue, 21 Feb 2023 06:54:03 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2601FC6A5F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Feb 2023 06:54:00 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31L2ZCQx019270; Tue, 21 Feb 2023 06:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=content-type :
 message-id : date : mime-version : to : cc : from : subject; s=qcppdkim1;
 bh=jiaK2/qOF99xkYFnwXvY3TWRdghW6YnAo/ugQQmeh2w=;
 b=St9pjwpZ33Esv80Vd8MOJxPAaD6SqS+m0fGwD7lz2dzph7l1aYMiqqQj0cZmVIetY0Cm
 XMyrs4UFjL0JOb8EoCOvgDlhP1N3m+4OI80L596/3UTdX7uoCcYS9ZSfZvWSNdgk+khS
 rylA0EFR+1nh0r56J/jw2/TcklH+1RCDsG2RXedhD1jQW7XHAeTe6yzl0saxmJqbXP9z
 0b7t5RFynba6dP1f9KyQEzSBTf1NFqt3kSdyJge3KBywua8oUzrY0kBRBynToDozWkKZ
 47JV1zx7f6jU2ir6ry0yYjOiZwzjMYJ7TBnL2bWTb95+G7YL3gYg46h+Xs3ATqIFg1MJ dA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ntmcm7175-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Feb 2023 06:53:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31L6rc0L001617
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Feb 2023 06:53:38 GMT
Received: from [10.239.133.9] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 20 Feb
 2023 22:53:35 -0800
Message-ID: <1dab6648-c177-17a7-0b36-821e21328753@quicinc.com>
Date: Tue, 21 Feb 2023 14:53:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>
From: Jinlong Mao <quic_jinlmao@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Tg0DHGCyyeQsbfqIE1FU7w0XlthIEGF9
X-Proofpoint-GUID: Tg0DHGCyyeQsbfqIE1FU7w0XlthIEGF9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_03,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=537 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302210060
Cc: Coresight ML <coresight@lists.linaro.org>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [RFC] Add trig_ts function in STM to generate TRIG_TS
 packet periodically
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
Content-Type: multipart/mixed; boundary="===============4330802804459889795=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============4330802804459889795==
Content-Type: multipart/alternative;
	boundary="------------4oyv0S7EB1m7BSIJ1fbiG94q"
Content-Language: en-US

--------------4oyv0S7EB1m7BSIJ1fbiG94q
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

When there is some small packet sent from STM to ETR, the small packet 
could be stuck between source
and sink even if manual flush is set when disable ETR.
So there is requirement that flush the STM trace periodically after 
enabling STM to ETR.

STM can generate TRIG_TS packet by writing to offset 0xF0 of the driver 
STM stimulus port.
ETR has ability to initiate a flush on seeing a TRIG_TS packet.

For this requirement, I want to create a sysfs node like trig_ts for STM.
When writing 1 to this sysfs node, a timer with 1 second periodicity in 
STM will start to generate the trig_ts packet to ETR.
Once ETR receive the TRIG_TS packet, it will initiate a flush.

Could you please help to provide your comments on this requirement ?

Thanks
Jinlong Mao

--------------4oyv0S7EB1m7BSIJ1fbiG94q
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Hi all,<br>
    <p>When there is some small packet sent from STM to ETR, the small
      packet could be stuck between source<br>
      and sink even if manual flush is set when disable ETR.<br>
      So there is requirement that flush the STM trace periodically
      after enabling STM to ETR.</p>
    <p><span><span class="ui-provider wk b c d e f g h i j k l m n o p q
          r s t u v w x y z ab ac ae af ag ah ai aj ak" dir="ltr">STM
          can generate TRIG_TS packet by writing to offset 0xF0 of the
          driver STM stimulus port. <br>
          ETR has ability to initiate a flush on seeing a TRIG_TS
          packet. <br>
          <br>
          For this requirement, I want to create a sysfs node like
          trig_ts for STM.<br>
          When writing 1 to this sysfs node, </span></span><span><span
          class="ui-provider wk b c d e f g h i j k l m n o p q r s t u
          v w x y z ab ac ae af ag ah ai aj ak" dir="ltr"> a timer with
          1 second periodicity in STM will start to generate the trig_ts
          packet to ETR.<br>
          Once ETR receive the TRIG_TS packet, it will initiate a flush.<br>
          <br>
          Could you please help to provide your comments on this
          requirement ?<br>
          <br>
          Thanks<br>
          Jinlong Mao<br>
        </span></span></p>
  </body>
</html>

--------------4oyv0S7EB1m7BSIJ1fbiG94q--

--===============4330802804459889795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4330802804459889795==--
